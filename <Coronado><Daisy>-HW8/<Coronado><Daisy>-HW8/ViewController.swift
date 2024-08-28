//
// ViewController.swift
// <Coronado><Daisy>-HW8
// Project: CoronadoDaisy-HW8
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 11/2/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    //create outlet for button on screen
    @IBOutlet weak var mainButton: UIButton!
    //create var
    //boolean to check if imageA is being shown
    var imageA:Bool!
    // create count
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // ask if app can send notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
            granted, error in
            if granted {
                print("All set!")
            }
            // if error occurs
            else if let error = error {
                print(error.localizedDescription)
            }
        }
        // sets image of uttower to imageView
        if let imageView: UIImage = UIImage(named: "uttower.png"){
            // sets mainButton to the image to be displayed
            mainButton.setImage(imageView, for: .normal)
            mainButton.imageView?.contentMode = .scaleAspectFill // makes the view take up the entire screen
            mainButton.contentMode = .center // centers the image
            imageA = true // set boolean to true since image a is being displayed
        }
    }
    // action will occur if the button/image is pressed
    @IBAction func buttonPressed(_ sender: Any) {
        // if image A is being displayed
        if imageA == true{
            // add to count since button was pressed
            count += 1
            // ease out the imageA
            UIView.animate(
                withDuration: 1.0,
                delay: 0.0,
                options: .curveEaseOut,
                animations: {
                    self.mainButton.alpha = 0.0
                },
                completion: { finished in
                    if let otherView: UIImage = UIImage(named: "ut.png"){ //set otherView to display other image
                        // set the main button to the new image
                        self.mainButton.setImage(otherView, for: .normal)
                        // set boolean to false since it is not being displayed
                        self.imageA = false
                    }
                    // ease in the next image
                    UIView.animate(
                        withDuration: 1.0,
                        delay: 0.0,
                        options: .curveEaseIn,
                        animations: {
                            self.mainButton.alpha = 1.0
                        },
                        completion: nil)
                })
        // if imageA is not being displayed
        }else if imageA == false{
            // add one to count
            count += 1
            // ease out imageB
            UIView.animate(
                withDuration: 1.0,
                delay: 0.0,
                options: .curveEaseOut,
                animations: {
                    self.mainButton.alpha = 0.0
                },
                completion: { finished in
                    // change button display to imageA
                    if let otherView: UIImage = UIImage(named: "uttower.png"){
                        self.mainButton.setImage(otherView, for: .normal) // set image to button
                        self.imageA = true
                    }
                    // ease in next image
                    UIView.animate(
                        withDuration: 1.0,
                        delay: 0.0,
                        options: .curveEaseIn,
                        animations: {
                            self.mainButton.alpha = 1.0
                        },
                        completion: nil)
                })
        }
        // check if count is 4 is equal divider
        if count % 4 == 0{
            // send notification is it is
            let content = UNMutableNotificationContent()
            content.title = "Click count"
            content.subtitle = "girly, why you click so much?"
            content.sound = UNNotificationSound.default
            content.body = "You have clicked \(count) times"
            
            // time it will take for notification to pop up
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
            // send request
            let request = UNNotificationRequest(identifier: "myNotification", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
    }
}
