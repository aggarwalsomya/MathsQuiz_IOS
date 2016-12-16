//
//  ViewController.swift
//  cmpe277_lab3
//
//  Created by Saurabh Gupta on 12/15/16.
//  Copyright © 2016 somya. All rights reserved.
//

import UIKit

class SubController: UIViewController {
    var result = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func subBackButton(_ sender: UIBarButtonItem) {
        showQuitAlertDialog()
    }
    
    func showQuitAlertDialog() {
        NSLog("Alert dialog button pressed")
        let talert = UIAlertController(title: "Quit", message: "Are you sure you want to quit the quiz?", preferredStyle: UIAlertControllerStyle.alert)
        talert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(action: UIAlertAction!) in
            _ = self.navigationController?.popViewController(animated: true)
        }))
        talert.addAction(UIAlertAction(title: "No", style: .default, handler:nil))
        present(talert, animated: true, completion: nil)
    }
    
    
    func showResultAlertDialog() {
        let talert = UIAlertController(title: "Score: \(result)", message: "Restart Quiz?", preferredStyle: UIAlertControllerStyle.alert)
        talert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction!) in
            _ = self.navigationController?.popViewController(animated: true)
        }))
        present(talert, animated: true, completion: nil)
    }
}

