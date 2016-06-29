//
//  CenterViewController.swift
//  SlideOutNavigationPanel
//
//  Created by Luis Arias on 28/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func toggleRightPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var delegate: CenterViewControllerDelegate?
    
    @IBAction func izqTapped(sender: AnyObject) {
    }
    
    @IBAction func derTapped(sender: AnyObject) {
        delegate?.toggleLeftPanel!()
    }
    
}
