//
//  ViewController.swift
//  cmpe277_lab3
//
//  Created by Saurabh Gupta on 12/15/16.
//  Copyright © 2016 somya. All rights reserved.
//

import UIKit

class MulController: UIViewController, KeyboardDelegate {
    var result = 0
    var n1 = 0
    var n2 = 0
    var qNumber = 0
    var ans = String()
    var expectedAns = Int()
    
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var quesNumber: UILabel!
    @IBOutlet weak var timeRem: UILabel!
    @IBOutlet weak var answer: UITextField!
    
    
    var counter = 5
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNextQuestion()
        initKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func mulBackButton(_ sender: UIBarButtonItem) {
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
    
    func keyWasTapped(character: String) {
        NSLog(character)
        if(character == "ENTER"){
            NSLog("Enter is pressed")
            ans = answer.text!
            
            if (Int(ans) != n1 * n2) {
                showError()
                if(qNumber < 10) {
                    prepareNextQuestion()
                } else {
                    timer.invalidate()
                    showResultAlertDialog()
                }
            } else {
                //if correct answer came in field, it was handled by text field listener
            }
            
        } else {
            NSLog("Number key is pressed")
            answer.insertText(character)
        }
    }
    
    //function to decrease the timer tick
    func timerAction() {
        counter = counter - 1
        timeRem.text = String(counter)
        
        if(counter == 0)
        {
            timer.invalidate()
            counter = 5
            if (answer.text?.isEmpty)! {
                
            } else {
                showError()
            }
            
            if(qNumber < 10) {
                prepareNextQuestion()
            } else {
                counter = 0
                showResultAlertDialog()
            }
        }
    }
    
    func initKeyboard() {
        let keyboardView = Keyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 300))
        keyboardView.delegate = self
        answer.inputView = keyboardView
        answer.becomeFirstResponder()
    }
    
    
    //func to return the result based on the numbers and operation
    func calcResult(n1:Int, n2:Int) ->Int {
        return n1 * n2
    }
    
    //function to start the timer
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.3, target: self, selector: #selector(timerAction), userInfo: nil,repeats: true)
    }
    
    //function to display the next question on the screen, quesNumber and set the expected Ans in model
    func prepareNextQuestion(){
        
        //generated number should be single digit
        n1 = generateRandomNumber()
        while(n1 >= 10) {
            n1 = generateRandomNumber()
        }
        
        n2 = generateRandomNumber()
        while(n2 >= 10 || n2 > n1) {
            n2 = generateRandomNumber()
        }
        
        answer.text=""
        
        var n1_s = String()
        n1_s = String(n1)
        
        var n2_s = String()
        n2_s = String(n2)
        
        number1.text = n1_s
        number2.text = n2_s
        
        expectedAns = calcResult(n1: n1, n2: n2)
        
        qNumber = qNumber + 1
        quesNumber.text = String(qNumber)
        
        timer.invalidate()
        counter = 5
        timeRem.text = String(counter)
        startTimer()
    }
    
    //function to generate the random numbers between 0-9
    func generateRandomNumber() -> Int{
        var RandomNumber = arc4random() % 10
        RandomNumber += 1
        return Int(RandomNumber)
    }
    
    @IBAction func ansChanged(_ sender: UITextField) {
        NSLog("Value Change method called for text field")
        ans = answer.text!
        if (Int(ans) == n1 * n2) {
            NSLog("Correct answer came in text field")
            showCorrect()
            result = result + 1
            if(qNumber < 10) {
                prepareNextQuestion()
            } else {
                timer.invalidate()
                showResultAlertDialog()
            }
        } else {
            NSLog("Waiting for correct answer");
        }
    }
    
    func showCorrect(){
        
        //position of label on screen
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 50, y: self.view.frame.size.height/2 - 250, width:200, height: 35))
        
        //background color
        //toastLabel.backgroundColor = UIColor.green
        
        //text color
        toastLabel.textColor = UIColor.green
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        toastLabel.text = "Correct!"
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 0.5, delay: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            toastLabel.alpha = 0.0
            
        });
    }
    
    func showError() {
        //position of label on screen
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 50, y: self.view.frame.size.height/2 - 250, width:200, height: 35))
        
        //background color
        //toastLabel.backgroundColor = UIColor.red
        
        //text color
        toastLabel.textColor = UIColor.red
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        toastLabel.text = "Incorrect!"
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 0.5, delay: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            toastLabel.alpha = 0.0
            
        });
    }
    
}

