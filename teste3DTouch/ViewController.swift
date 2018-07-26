//
//  ViewController.swift
//  teste3DTouch
//
//  Created by Ada 2018 on 24/07/2018.
//  Copyright © 2018 Alan. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIViewControllerPreviewingDelegate,SFSafariViewControllerDelegate {

    @IBOutlet weak var alan: UIImageView!
    @IBOutlet weak var panico: UIImageView!
    
    let urlString = "https://www.google.com.br"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Check device capability with 3DTouch
        if self.traitCollection.forceTouchCapability == .available {
            
            registerForPreviewing(with: self, sourceView: view)
//            registerForPreviewing(with: self, sourceView: self.alan)
            
            print("This device is available")
        } else {
           print("This device isn't available")
        }
    }
    

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?{
        let convertedLocationAlan = view.convert(location, to: alan)
        let convertedLocationPanico = view.convert(location, to: self.panico)
        if alan.bounds.contains(convertedLocationAlan){
            guard let url = URL(string: urlString)else{return nil}
            
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            return vc
        
            
//            let popVC = storyboard?.instantiateViewController(withIdentifier: "view2")
            //Set your height
//            popVC?.preferredContentSize = CGSize(width: 0.0, height: 300)
//            previewingContext.sourceRect = alan.frame
//            return popVC
        }else if panico.bounds.contains(convertedLocationPanico){
            let popVC = storyboard?.instantiateViewController(withIdentifier: "view1")
            //Set your height
            //            popVC?.preferredContentSize = CGSize(width: 0.0, height: 300)
            //            previewingContext.sourceRect = alan.frame
            return popVC
        }else{
            return nil
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController){
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "view3")
        show(VC!, sender: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

