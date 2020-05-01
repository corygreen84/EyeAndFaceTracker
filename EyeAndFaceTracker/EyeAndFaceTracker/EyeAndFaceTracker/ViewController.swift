//
//  ViewController.swift
//  EyeAndFaceTracker
//
//  Created by Cory Green on 4/29/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var startStopButton: UIButton!
    
    var buttonState: Bool = false
    
    var arrayOfVertices: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        // making sure the device is supported - i.e. at least iPhone X //
        guard ARFaceTrackingConfiguration.isSupported else {
            fatalError("Face tracking is not supported on this device")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // pausing the face tracking //
        sceneView.session.pause()
    }
    
    @IBAction func startStopOnClick(_ sender: UIButton, forEvent event: UIEvent) {
        
        buttonState = !buttonState
        
        if(buttonState){
            
            // running the face tracking config
            let config = ARFaceTrackingConfiguration()
            sceneView.session.run(config)
            
            startStopButton.setTitle("Stop Session", for: UIControl.State.normal)
            
            arrayOfVertices.removeAll()
            
        }else{
            // pausing the face tracking //
            sceneView.session.pause()
            startStopButton.setTitle("Start Session", for: UIControl.State.normal)
            
            
            print("verticies -> \(arrayOfVertices.count)")
            
        }
    }
}

// adding an extension to Viewcontroller -> ARSCNViewDelegate
extension ViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = sceneView.device else {
            return nil
        }
        
        let faceGeometry = ARSCNFaceGeometry(device: device)
        
        let node = SCNNode(geometry: faceGeometry)
        
        node.geometry?.firstMaterial?.fillMode = .lines
        
        return node
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
        guard let faceAnchor = anchor as? ARFaceAnchor,
            let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
            return
        }
        
        // print("this is geometry -> \(faceAnchor.geometry.vertices)")
        arrayOfVertices.append(contentsOf: faceAnchor.geometry.vertices)
        
        faceGeometry.update(from: faceAnchor.geometry)
    }
}


