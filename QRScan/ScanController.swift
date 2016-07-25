//
//  ScanController.swift
//  QRScan
//
//  Created by zonebin on 16/7/25.
//  Copyright © 2016年 zonebin. All rights reserved.
//

import UIKit
import AVFoundation

class ScanController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    var session: AVCaptureSession?
    var isCaptured: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.isCaptured = false
        self.session = AVCaptureSession.init()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.capture()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.isCaptured = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func capture() {
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        var input: AVCaptureDeviceInput?
        do{
            input = try AVCaptureDeviceInput.init(device: device)
        }catch {
            print(error)
        }
        
        let out = AVCaptureMetadataOutput.init()
        out.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        self.session?.addInput(input)
        self.session?.addOutput(out)
        out.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        let layer = AVCaptureVideoPreviewLayer.init(session: self.session!)
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        layer.frame = self.view.frame
        self.view.layer.insertSublayer(layer, atIndex: 0)
        
        self.session?.startRunning()
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        let metadataobject:AVMetadataMachineReadableCodeObject = metadataObjects.first as! AVMetadataMachineReadableCodeObject
        if metadataobject.type == AVMetadataObjectTypeQRCode && !self.isCaptured! {
            self.isCaptured = true
            print(metadataobject.stringValue)
        }
        
    }
    
//    func getScanCrop(rect:CGRect, readerViewBounds:CGRect) -> CGRect {
//        let x,y,width,heith:CGFont
//        
//        x = (readerViewBounds.height - rect.height)/2/readerViewBounds.height
//        y = (readerViewBounds.width - rect.width)/2/readerViewBounds.width
//        width = rect.height/readerViewBounds.height
//        heith = rect.width/readerViewBounds.width
//        
//        rect
//    }

}
