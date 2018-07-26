//
//  PanicoViewController.swift
//  teste3DTouch
//
//  Created by Ada 2018 on 25/07/2018.
//  Copyright © 2018 Alan. All rights reserved.
//

import UIKit

class PanicoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        var previewaction1 = UIPreviewAction(title: "Whatever", style: .default) { (previewAction, view) in
            print(previewAction.title)
        }
        
        return [previewaction1]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
