//
//  Keyboard.swift
//  Lab3
//
//  Created by Anshuman Tripathi on 11/24/16.
//  Copyright © 2016 somya. All rights reserved.
//

import UIKit

protocol KeyboardDelegate: class {
    func keyWasTapped(character: String)
}

class Keyboard: UIView {
    
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var enter: UIButton!
    func sendKeyValue(value:String) {
        NSLog("Key was tapped: Sending Value to controller:")
        NSLog(value)
        
        self.delegate?.keyWasTapped(character: value)
    }
    
    // This variable will be set as the view controller so that
    @IBAction func keyTapped(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        
        NSLog("Pressed key: keyTapped fn")
        NSLog(char)
        
        sendKeyValue(value: char)
    }
    
    @IBAction func keyTapped2(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    @IBAction func keyTapped3(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    @IBAction func keyTapped4(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    @IBAction func keyTapped5(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    @IBAction func keyTapped6(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    @IBAction func keyTapped7(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    @IBAction func keyTapped8(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    @IBAction func keyTapped9(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    @IBAction func keyTapped0(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    @IBAction func enterKeyTapped(_ sender: UIButton) {
        var char = String()
        char = (sender.titleLabel?.text!)!
        sendKeyValue(value: char)
    }
    
    // the keyboard can send messages to the view controller.
    weak var delegate: KeyboardDelegate?
    
    // MARK:- keyboard initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
    }
    
    func initializeSubviews() {
        let xibFileName = "Keyboard" // xib extention not included
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)?[0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
}
