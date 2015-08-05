//
//  ViewController.swift
//  transitionExample
//
//  Created by Richard Turton on 05/08/2015.
//  Copyright (c) 2015 commandshift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self;
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! UIViewController
        destination.transitioningDelegate = self
    }

}

extension ViewController : UINavigationControllerDelegate {
    
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
}

extension ViewController : UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self;
    }
}

private let duration = 2.0;
extension ViewController : UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let newView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let container = transitionContext.containerView()
        newView.frame = container.bounds;
        newView.alpha = 0.0;
        container.addSubview(newView)
        
        UIView.animateWithDuration(duration, animations: {
            newView.alpha = 1.0;
            }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}

