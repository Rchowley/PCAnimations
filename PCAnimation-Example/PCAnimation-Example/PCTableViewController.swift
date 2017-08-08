//
//  PCTableViewController.swift
//  PCAnimation-Example
//
//  Created by Priyabrata Chowley on 15/07/17.
//  Copyright © 2017 Priyabrata Chowley. All rights reserved.
//

import UIKit

class PCAnimationsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCard.layer.masksToBounds = false;
        viewCard.layer.shadowOffset = CGSize(width: -5, height: 5)
        viewCard.layer.shadowRadius = 5;
        viewCard.layer.shadowOpacity = 0.5;
        viewCard.layer.shadowColor = UIColor.red.withAlphaComponent(0.5).cgColor
    }
}

enum animationType : Int {
    case fade
    case fromLeft
    case fromRight
}

class PCTableViewController: UIViewController {

    @IBOutlet weak var tableV: UITableView!
    var cellAnimation : animationType = .fade
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableV.estimatedRowHeight = 100;
        tableV.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionSegmentValueChanged(_ sender: UISegmentedControl) {
        
        cellAnimation = animationType(rawValue: sender.selectedSegmentIndex)!;
        self.tableV.reloadData()
    }
}

extension PCTableViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PCAnimationsTableViewCell", for: indexPath) as! PCAnimationsTableViewCell;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //you can use this animtion function on UIView as well. Based on your needs. Shown here bacause for me it is looking good in cell animations.
        switch cellAnimation {
        case .fade:
            cell.animationFade();
        case .fromLeft:
            cell.animationFromLeft();
        case .fromRight:
            cell.animationFromRight();
        }
    }
}
