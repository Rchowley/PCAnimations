//
//  MoreViewController.swift
//  PCAnimation-Example
//
//  Created by Priyabrata Chowley on 04/08/17.
//  Copyright © 2017 Priyabrata Chowley. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionButton(_ sender: Any) {
        
        let button = sender as! UIButton
        
        switch button.tag {
        case 0:
            PCAnimations.shared.animationPulse(onView: button);
        case 1:
            PCAnimations.shared.animationShake(onView: button)
        case 2:
            PCAnimations.shared.animationFlash(onView: button)
        case 3:
            PCAnimations.shared.animationPop(button, minimumSize: 1.0, maximumSize: 1.5, withDuration: 0.5)
        case 4:
            PCAnimations.shared.animationScale(button, fromScale: 1.0, toScale: 1.2, withDuration: 0.3)
        default:
            print("def");
        }
        
    }

}
