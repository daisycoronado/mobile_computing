//
// CountdownViewController.swift
// <Coronado><Daisy>-HW7
// Project: CoronadoDaisy-HW7
// EID: dc44789
// Course: CS329E
//  Created by Daisy Coronado on 10/24/23.
//
import UIKit

class CountdownViewController: UIViewController {
    
    // create var and let for timer array, queue, countdown, and delegate
    let queue = DispatchQueue(label: "myQueue", qos:.background)
    var delegate: UIViewController!
    var newTimer = [Timer]()
    var countDown = -1
    
    // create outlets for time, location, and event labels to be displayed
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // create let values to access the timer
        let event = newTimer[0].event
        let location = newTimer[0].location
        // set countdown to access remaining time
        countDown = Int(newTimer[0].remainingTime)!
        // set labels equal to the values
        eventLabel.text = "\(event)"
        locationLabel.text = "\(location)"
        countTimer()
    }
    // function occurs when the view controller disappers
    override func viewDidDisappear(_ animated: Bool) {
        // change the value of remaining time with the new value
        let mainVC = delegate as! ViewController
        mainVC.createTime(remainingTimer: timeLabel.text!)
        self.dismiss(animated: true)
    }
    // function counts down by one
    func countTimer(){
        queue.async {
            // while the value of countDown is not 0 then
            while (self.countDown > 0) {
                // will subtract one from the value
                sleep(1)
                self.countDown -= 1
            }
        }
        // sets the label equal the countdown
        DispatchQueue.main.async {
            self.timeLabel.text = String(self.countDown)
            self.countTimer()
        }
    }
}
