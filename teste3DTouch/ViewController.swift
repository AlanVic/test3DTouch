//
//  ViewController.swift
//  teste3DTouch
//
//  Created by Ada 2018 on 24/07/2018.
//  Copyright © 2018 Alan. All rights reserved.
//

import UIKit
import SafariServices
import WebKit


class ViewController: UIViewController, UIViewControllerPreviewingDelegate,SFSafariViewControllerDelegate {
    // Referencias Outlets para as duas imagens
    @IBOutlet weak var imageWebKit: UIImageView!
    @IBOutlet weak var imageSafari: UIImageView!
    
    //Url padrão para teste
    let urlString = "https://www.google.com.br"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Checando aparelho se é compativel com 3D Touch
        if self.traitCollection.forceTouchCapability == .available {
            
            registerForPreviewing(with: self, sourceView: view)
            
            print("This device is available")
        } else {
           print("This device isn't available")
        }
    }
    

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?{
        
        // Convertendo localização das imagens para CGPoint que será usado na comparação de onde foi clicado
        let convertedLocationImageWebKit = view.convert(location, to: self.imageWebKit)
        let convertedLocationImageSafari = view.convert(location, to: imageSafari)
        
        //Se clicado na imagem do safari se será mostrado o peek do safari e caso clicado na imagem do webkit
        // será mostrado o peek do webkit
        if imageWebKit.bounds.contains(convertedLocationImageSafari){
            //converter url para
            guard let url = URL(string: urlString)else{return nil}
            
            let peekVC = SFSafariViewController(url: url)
            peekVC.delegate = self
            return peekVC
        }else if imageSafari.bounds.contains(convertedLocationImageWebKit){

            guard let url = URL(string: urlString)else{return nil}
            
            let peekVC = UIViewController()
            let webView: WKWebView = WKWebView()
            webView.navigationDelegate = peekVC
            
            peekVC.view = webView
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = false
            
            
            return peekVC
        }else{
            return nil
        }
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController){
 
        // Faz o pop indo para a tela de destino
        show(viewControllerToCommit, sender: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIViewController: WKNavigationDelegate{
    
}

