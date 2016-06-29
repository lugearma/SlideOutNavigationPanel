//
//  ContainerViewController.swift
//  SlideOutNavigationPanel
//
//  Created by Luis Arias on 28/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit
import QuartzCore

class ContainerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension UIStoryboard {
    
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    class func leftViewController() -> SidePanelViewController {
        return (mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? SidePanelViewController)!
    }
    
    class func centerViewController() -> CenterViewController {
        return (mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController)!
    }
}
