//
//  ViewController.swift
//  SwiftyReachability
//
//  Created by Sugam Kalra on 08/12/15.
//  Copyright © 2015 Sugam Kalra. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnCheckNetworkPressed(sender: UIButton)
    {
        
        // Check for network first
        
        if !Reachability.isConnectedToNetwork()
        {
            let alertController: UIAlertController = UIAlertController(title: "No Network Available", message: "Please Check Your Internet Connection", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "Ok", style:.Default) { (action) -> Void in
                
            }
            
            alertController.addAction(okAction)
            
            
            self.presentViewController(alertController, animated: true, completion: nil)
        
        }
            
        else
        {
            let alertController: UIAlertController = UIAlertController(title: "Network Available", message: "Internet Connection is Available", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "Ok", style:.Default) { (action) -> Void in
                
            }
            
            alertController.addAction(okAction)
            
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

