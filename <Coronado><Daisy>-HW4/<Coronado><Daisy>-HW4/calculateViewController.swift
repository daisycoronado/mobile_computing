//
// ViewController.swift
// Project: CoronadoDaisy-HW4
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 9/21/23.
//
import UIKit

class calculateViewController: UIViewController {
    
    // create outlets for operandOne, operandTwoField, chosenOperator, showResult
    @IBOutlet weak var operandOne: UITextField!
    @IBOutlet weak var operandTwoField: UITextField!
    @IBOutlet weak var chosenOperator: UILabel!
    @IBOutlet weak var showResult: UILabel!
    
    // operatorName is created to be used throughout class
    var operatorName = ""
    
    // override function to load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // function is used to show the correlating operator
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        // operatorIndex is used to find the operatorName and its index
        let operatorIndex = dataArray.firstIndex(of: operatorName)
        // this will then set the chosenOperator to the correlating symbol from the array set in the viewController
        chosenOperator.text = symbolOperator[operatorIndex!]
    }
    
    // called when return key is pressed
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // called when the user clicks on the view outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // this function work when the calculate button is pressed
    @IBAction func calculateButton(_ sender: Any) {
        // sets valueOne and valueTwo to the textfields operandOne and operandTwoField
        let valueOne: String = operandOne.text!
        let valueTwo: String = operandTwoField.text!
        
        // This check is the enter values are integers
        if let newOne = Int(valueOne), let newTwo = Int(valueTwo){
            // result is printed as integer
            let result:Int
            // if the chosen operator is == to - it will subtract the values
            if chosenOperator.text == "-"{
                result = newOne - newTwo
                // returns to allow the user to keep enter numbers and doing calculations
                // sets the showResult to the result calculated
                showResult.text = String(result)
                return
            // if the chosen operator is == to + it will add the values
            } else if chosenOperator.text == "+"{
                result = newOne + newTwo
                showResult.text = String(result)
                return
            // if the chosen operator is == to * it will multiply the values
            } else if chosenOperator.text == "*"{
                result = newOne * newTwo
                showResult.text = String(result)
                return
            // if the chosen operator is == to / it will divide the values
            } else if chosenOperator.text == "/"{
                result = newOne / newTwo
                showResult.text = String(result)
                return
            }
        // if the entered number is a float it will do the following calculations
        } else if let newOne = Float(valueOne), let newTwo = Float(valueTwo){
            // the result will be printed as a float
            let result:Float
            // if the chosen operator is == to - it will subtract the values
            if chosenOperator.text == "-"{
                result = newOne - newTwo
                showResult.text = String(result)
                return
            // if the chosen operator is == to + it will add the values
            } else if chosenOperator.text == "+"{
                result = newOne + newTwo
                showResult.text = String(result)
                return
            // if the chosen operator is == to * it will multiply the values
            } else if chosenOperator.text == "*"{
                result = newOne * newTwo
                showResult.text = String(result)
                return
            // if the chosen operator is == to / it will divide the values
            } else if chosenOperator.text == "/"{
                result = newOne / newTwo
                showResult.text = String(result)
                return
            }
        // if the entered values are neither float or integer then it print
        }else{
            // showResult is set to the message that will be shown if value is not entered
            showResult.text = "Need two values for calculation"
            //returns so user can enter values and do calculations
            return
        }
    }
}
