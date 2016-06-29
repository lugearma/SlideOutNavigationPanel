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
    
    var centerNavigationViewController: UINavigationController!
    var centerViewController: CenterViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.centerViewController = UIStoryboard.centerViewController()
        self.centerViewController.delegate = self
        
        self.centerNavigationViewController = UINavigationController(rootViewController: self.centerViewController)
        view.addSubview(self.centerNavigationViewController.view)
        addChildViewController(self.centerNavigationViewController)
        self.centerNavigationViewController.didMoveToParentViewController(self)
    }
}

extension ContainerViewController: CenterViewControllerDelegate {
    func toggleLeftPanel() {
        
    }
    
    func toggleRightPanel() {
        
    }
    
    func addLeftPanelViewController() {
        
    }
    
    func addRightPanelViewController() {
        
    }
    
    func animateLeftPanel() {
        
    }
    
    func animateRightPanel() {
        
    }
}

private extension UIStoryboard {
    
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    class func leftViewController() -> SidePanelViewController {
        return (mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? SidePanelViewController)!
    }
    
    class func rightViewController() -> SidePanelViewController {
        return (mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? SidePanelViewController)!
    }
    
    class func centerViewController() -> CenterViewController {
        return (mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController)!
    }
}
