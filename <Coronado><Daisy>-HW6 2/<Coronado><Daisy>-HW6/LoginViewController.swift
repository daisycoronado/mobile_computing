//
//  LoginViewController.swift
//  Project: CoronadoDaisy-HW6
//  EID: dc44789
//  Course: CS329E
//  Created by Daisy Coronado on 10/18/23.
//
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // create outlets to be used to later on
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var segCtrl: UISegmentedControl!
    @IBOutlet weak var confirmLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    // create identifier to be used to segue
    let loginIdentifier = "loginIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // allow password field and confirm field to be hidden from others
        confirmField.isHidden = true
        confirmLabel.isHidden = true
        // perform a segue if identifier matches
        Auth.auth().addStateDidChangeListener() {
            (auth,user) in
            if user != nil {
                self.performSegue(withIdentifier: "loginIdentifier", sender: self)
                // id field and password field are nil and empty if not filled
                self.idField.text = nil
                self.passwordField.text = nil
            } else {
                self.statusLabel.text = "Status"
            }
        }
    }
    // action done if sign in/sign out button is pressed
    @IBAction func signButton(_ sender: Any) {
        // if the title of the button is sign in
        if (signInButton.titleLabel!.text! == "Sign In") {
            // sign in is authorized if email and password are matched
            Auth.auth().signIn(withEmail: idField.text!, password: passwordField.text!) {
             (authResult,error) in
                // if entered id and password are not found
                if let error = error as NSError? {
                    // error is shown as status label
                    self.statusLabel.text = "\(error.localizedDescription)"
                } else {
                    // if entered id and password are found
                    self.statusLabel.text = "Successful Login"
                }
            }
        // if the title of the button is sign up
        }else if (signInButton.titleLabel!.text! == "Sign Up") {
            // if password and confirm field are == to eachother
            if passwordField.text! == confirmField.text!{
                // new user is created with email and password
                Auth.auth().createUser(withEmail: idField.text!, password: passwordField.text!) {
                    (authResult,error) in
                    // if entered id and password are not found
                    if let error = error as NSError? {
                        // error is shown as status label
                        self.statusLabel.text = "\(error.localizedDescription)"
                    } else {
                        // if entered id and password are found
                        self.statusLabel.text = "Successful Sign Up"
                    }
                }
            // passwords do not match
            }else if passwordField.text! != confirmField.text!{
                self.statusLabel.text = "Passwords do not match"
            }
        }
    }
    // if segment is changed
    @IBAction func segCtrlChanged(_ sender: Any) {
        switch segCtrl.selectedSegmentIndex {
        // if seg is set to 0 then the title of button is set to sign in
        case 0:
            signInButton.setTitle("Sign In", for: .normal)
            // hides labels
            confirmLabel.isHidden = true
            confirmField.isHidden = true
        // if seg is set to 0 then the title of button is set to sign up
        case 1:
            signInButton.setTitle("Sign Up", for: .normal)
            // allows them to appear
            confirmLabel.isHidden = false
            confirmField.isHidden = false
        // else then it defaults to sign in
        default:
            signInButton.setTitle("Sign In", for: .normal)
            // hides labels
            confirmLabel.isHidden = true
            confirmField.isHidden = true
        }
    }
}
