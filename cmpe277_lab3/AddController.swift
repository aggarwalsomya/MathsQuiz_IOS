//
//  ViewController.swift
//  cmpe277_lab3
//
//  Created by Saurabh Gupta on 12/15/16.
//  Copyright © 2016 somya. All rights reserved.
//

import UIKit

class AddController: UIViewController,KeyboardDelegate {
    var result = 0
    var n1 = 0
    var n2 = 0
    var qNumber = 0
    var ans = String()
    var expectedAns = Int()

    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var quesNumber: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var timeRem: UILabel!
    
    var counter = 5
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNextQuestion()
        initKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //function called on action : editing changed
    @IBAction func ansChanged(_ sender: UITextField) {
        NSLog("Value Change method called for text field")
        ans = answer.text!
        if (Int(ans) == n1 + n2) {
            NSLog("Correct answer came in text field")
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
    
    
    //action handler when back button is pressed from the navigation bar
    @IBAction func backPrompt(_ sender: UIBarButtonItem) {
        showQuitAlertDialog()
    }
    
    //dummy function to check the functionality of the result button
    @IBAction func resultButton(_ sender: UIButton) {
        prepareNextQuestion()
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
        self.present(talert, animated: true, completion: nil)
    }
    
    //function to generate the random numbers between 0-9
    func generateRandomNumber() -> Int{
        var RandomNumber = arc4random() % 10
        RandomNumber += 1
        return Int(RandomNumber)
    }
    
    //function to display the next question on the screen, quesNumber and set the expected Ans in model
    func prepareNextQuestion(){
        
        n1 = generateRandomNumber()
        n2 = generateRandomNumber()
        
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
    
    //func to return the result based on the numbers and operation
    func calcResult(n1:Int, n2:Int) ->Int {
        return n1+n2
    }
    
    //function to start the timer
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.3, target: self, selector: #selector(timerAction), userInfo: nil,repeats: true)
    }

    //function to decrease the timer tick
    func timerAction() {
        counter = counter - 1
        timeRem.text = String(counter)
    
        if(counter == 0)
        {
            timer.invalidate()
            counter = 5
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
    
    func keyWasTapped(character: String) {
        NSLog(character)
        if(character == "ENTER"){
            NSLog("Enter is pressed")
        } else {
            NSLog("Number key is pressed")
            answer.insertText(character)
        }
    }
    
}

