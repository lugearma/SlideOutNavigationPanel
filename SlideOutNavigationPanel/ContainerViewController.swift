//
//  ContainerViewController.swift
//  SlideOutNavigationPanel
//
//  Created by Luis Arias on 28/06/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case BothCollapsed
    case LeftPanelExpanded
    case RigthPanelExpanded
}

class ContainerViewController: UIViewController {
    
    var centerNavigationViewController: UINavigationController!
    var centerViewController: CenterViewController!
    var leftViewController: SidePanelViewController?
    let centerPanelExpandedOffset: CGFloat = 60
    
    var currentState: SlideOutState = .BothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .BothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
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
        
        let notAlreadyExpanded = (currentState != .LeftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        animateLeftPanel(notAlreadyExpanded)
    }
    
    func toggleRightPanel() {
        
    }
    
    func addLeftPanelViewController() {
        if leftViewController == nil {
            leftViewController = UIStoryboard.leftViewController()
            leftViewController?.animals = Animal.allCats()
            
            addChildSidePanelViewController(leftViewController!)
        }
    }
    
    func addChildSidePanelViewController(sidePanel:SidePanelViewController) {
        view.insertSubview(sidePanel.view, atIndex: 0)
        addChildViewController(sidePanel)
        sidePanel.didMoveToParentViewController(self)
    }
    
    func addRightPanelViewController() {
        
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
            currentState = .LeftPanelExpanded
            
            animateCenterPanelXPosition(CGRectGetWidth(centerNavigationViewController.view.frame) - centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(0) { finished in
                self.currentState = .BothCollapsed
                self.leftViewController!.view.removeFromSuperview()
                self.leftViewController = nil
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: (Bool -> Void)! = nil){
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
                self.centerNavigationViewController.view.frame.origin.x = targetPosition
            }, completion: completion)
        
    }
    
    func animateRightPanel() {
        
    }
    
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        if shouldShowShadow {
            centerNavigationViewController.view.layer.shadowOpacity = 0.8
        } else {
            centerNavigationViewController.view.layer.shadowOpacity = 0.0
        }
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
