// changeColorVC.swift
// Project: CoronadoDaisy-HW3
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 9/19/23.

import UIKit

class changeColorVC: UIViewController {
    // set var delegate to UIViewController
    var delegate: UIViewController!
    
    // create over ride function
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // add action if blue button is pressed
    @IBAction func bluePressed(_ sender: Any) {
        // change background text if button is pressed to blue
        let otherVC2 = delegate as! TextColor
        otherVC2.changeColor(newColor: UIColor.blue)
        self.dismiss(animated: true)
    }
    
    // add action if red button is pressed
    @IBAction func redPressed(_ sender: Any) {
        // change background text if button is pressed to red
        let otherVC2 = delegate as! TextColor
        otherVC2.changeColor(newColor: UIColor.red)
        self.dismiss(animated: true)
    }
}
