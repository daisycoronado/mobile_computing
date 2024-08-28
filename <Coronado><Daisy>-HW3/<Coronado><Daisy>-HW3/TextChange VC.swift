// changeColorVC.swift
// Project: CoronadoDaisy-HW3
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 9/19/23.

import UIKit

class TextChange_VC: UIViewController {
    // create outlet for textfield2
    @IBOutlet weak var textField2: UITextField!
    
    //create vars and set equal
    var delegate: UIViewController!
    var vc2NewText = ""
    
    // create override function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set textField equal to new text
        // Do any additional setup after loading the view.
        textField2.text = vc2NewText
    }
    // create action to be able to press color button
    @IBAction func colorButtonpressed(_ sender: Any) {
        // changes the text if text field is changed and updates new one
        let otherVC = delegate as! TextChanger
        otherVC.changeText(newText: textField2.text!)
        self.dismiss(animated: true)
    }
}
