//
//  ViewController.swift
//  cmpe277_lab3
//
//  Created by Saurabh Gupta on 12/15/16.
//  Copyright © 2016 somya. All rights reserved.
//

import UIKit

class AddController: UIViewController {
    var result = 0

    //action handler when back button is pressed from the navigation bar
    @IBAction func backPrompt(_ sender: UIBarButtonItem) {
        showQuitAlertDialog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //dummy function to check the functionality of the result button
    @IBAction func resultButton(_ sender: UIButton) {
        showResultAlertDialog()
    }
    
    
    //show the alert dialog when user attempts to press the back button while playing the game.
    func showQuitAlertDialog() {
        NSLog("Alert dialog button pressed")
        let talert = UIAlertController(title: "Quit", message: "Are you sure you want to quit the quiz?", preferredStyle: UIAlertControllerStyle.alert)
        talert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {(action: UIAlertAction!) in
            _ = self.navigationController?.popViewController(animated: true)
        }))
        talert.addAction(UIAlertAction(title: "No", style: .default, handler:nil))
        present(talert, animated: true, completion: nil)
    }
    
    //shows the alert dialog when user is done with the game.
    func showResultAlertDialog() {
        let talert = UIAlertController(title: "Score: \(result)", message: "Restart Quiz?", preferredStyle: UIAlertControllerStyle.alert)
        talert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction!) in
            _ = self.navigationController?.popViewController(animated: true)
        }))
        present(talert, animated: true, completion: nil)
    }
}

