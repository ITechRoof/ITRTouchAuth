//
//  ViewController.swift
//  ITRTouchAuth_Swift
//
//  Created by kiruthika selvavinayagam on 11/9/15.
//  Copyright © 2015 kiruthika selvavinayagam. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction
    func authoriseClicked() {
        let myContext = LAContext()
        var authError : NSError?
        let myLocalizedReasonString = "To allow to view other screen"
        
        if(myContext .canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError)) {
            [myContext .evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString, reply: { (success: Bool, error: NSError?) -> Void in
                
                if success {
                     dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.presentViewController(UINavigationController(rootViewController: UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ITRAuthorisedViewController")) , animated: true, completion: nil)
                    })
                }else {
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: {
                            action in
                            self.dismissViewControllerAnimated(true, completion: nil)
                            
                        }))
                        self.presentViewController(alert, animated: true, completion: nil)
                    })
                }
                
            })];
        }else {
            let alert = UIAlertController(title: "Error", message: authError?.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: {
                action in
                    self.dismissViewControllerAnimated(true, completion: nil)
                
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    
}

