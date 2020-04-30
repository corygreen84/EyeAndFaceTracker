//
//  ViewController.swift
//  EyeAndFaceTracker
//
//  Created by Cory Green on 4/29/20.
//  Copyright © 2020 Cory Green. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainCameraView: UIView!
    
    var session: AVCaptureSession?
    var input: AVCaptureDeviceInput?
    var output: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getDevice(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        
        /*
        let devices: NSArray = AVCaptureDevice.DiscoverySession
        
        for d in devices {
            let deviceConverted = d as! AVCaptureDevice
        }
        */
        
        return nil
    }


}

