//
// AddTimerViewController.swift
// <Coronado><Daisy>-HW7
// Project: CoronadoDaisy-HW7
// EID: dc44789
// Course: CS329E
//  Created by Daisy Coronado on 10/24/23.
//
import UIKit

class AddTimerViewController: UIViewController {
    
    // create delegate and newTimer to be used when saved is pressed
    var delegate: UIViewController!
    var newTimer = Timer(event: "", location: "", remainingTime: "")
    
    // create outlets to be changed later
    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var eventField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // action function occurs when the save button is pressed
    @IBAction func saveTimerButton(_ sender: Any) {
        // new timer variables are set to the text fields to be displayed
        
        let newTimer = Timer(event: eventField.text!, location: locationField.text!, remainingTime: totalField.text!)
        // add if loop to make sure there is something in the textfields
        if newTimer.event != "" && newTimer.location != "" && newTimer.remainingTime != "" {
            // new timer is added to the list
            let addVC = delegate as! AddTimer
            addVC.newTimer(addTimer: newTimer)
        }
    }
}
