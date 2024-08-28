// Project: CoronadoDaisy-HW2
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 9/10/23.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // add outlets and action for text fields, status label, and button
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        idField.delegate = self
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        // retrive userID and password
        let name = idField.text!
        let password = passField.text!
        
        // create if statements to check fields if empty
        if name.isEmpty{
            let message = "Invalid login"       // create message
            statusLabel.text = message          //put message in status label
        }else if password.isEmpty{
            let message = "Invalid login"
            statusLabel.text = message
        }else{
            // if both fields are not empty
            let message = "\(name) logged in"
            statusLabel.text = message
        }
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

}
