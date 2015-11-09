//
//  ITRAuthorisedViewController.swift
//  ITRTouchAuth_Swift
//
//  Created by kiruthika selvavinayagam on 11/9/15.
//  Copyright © 2015 kiruthika selvavinayagam. All rights reserved.
//

import UIKit

class ITRAuthorisedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(title:"Cancel", style: UIBarButtonItemStyle.Plain, target: self, action:"dismissClicked")]
    }
    func dismissClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
