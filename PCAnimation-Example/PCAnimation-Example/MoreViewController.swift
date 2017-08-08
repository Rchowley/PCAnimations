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
            button.animationPulse();
        case 1:
            button.animationShake()
        case 2:
            button.animationFlash()
        case 3:
            button.animationPop(fromMinimumSize: 1.0, maximumSize: 1.5, withDuration: 0.5)
        case 4:
            button.animationScale(fromScale: 1.0, toScale: 1.2, withDuration: 0.3)
        default:
            print("def");
        }
        
    }

}
