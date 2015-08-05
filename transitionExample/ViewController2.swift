//
//  ViewController2.swift
//  transitionExample
//
//  Created by Richard Turton on 05/08/2015.
//  Copyright (c) 2015 commandshift. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.LandscapeRight.rawValue)
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
