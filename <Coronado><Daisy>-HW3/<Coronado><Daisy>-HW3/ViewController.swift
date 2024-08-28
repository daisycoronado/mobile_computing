// changeColorVC.swift
// Project: CoronadoDaisy-HW3
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 9/19/23.

import UIKit

class ViewController: UIViewController, TextChanger, TextColor{
    // create outlet for textfield1
    @IBOutlet weak var textField1: UILabel!
    
    // create override function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // set textfield = to text so it can be edited in other controllers
        textField1.text = "Text goes here"
    }
    // create override func to prepare for sgue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if segue identifier is == to textChange then
        if segue.identifier == "textChangeSegue",
           // make destination textchange vc if the identifier is
           let nextVC = segue.destination as? TextChange_VC
        {
            nextVC.delegate = self
            nextVC.vc2NewText = textField1.text!
        }
        // if segue identifier is == to textChange then
        if segue.identifier == "changeColorSegue",
           // make destination textchange vc if the identifier is
           let nextVC = segue.destination as? changeColorVC
        {
            nextVC.delegate = self
        }
    }
    // add function to set textField1 equal to newName
    func changeText(newText: String) {
        textField1.text = newText
    }
    // add function to set the new color
    func changeColor(newColor: UIColor) {
        textField1.backgroundColor = newColor
    }
}
