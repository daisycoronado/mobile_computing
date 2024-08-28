//
// ViewController.swift
// <Coronado><Daisy>-HW7
// Project: CoronadoDaisy-HW7
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 10/24/23.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTimer, NewTime{
    // set var and let to values and create list
    var timerList = [Timer]()
    var delegate: UIViewController!
    let textCellIdentifier = "TimerTable-ViewCell"
    
    // create outlet for the tableview
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // create delegate and datasource for tableview
        tableView.delegate = self
        tableView.dataSource = self
    }
    // function for segue to other view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if identifier is equal to a certain segue the it will prepare
        if segue.identifier == "addTimerSegue",
           // new vc
           let addVC = segue.destination as? AddTimerViewController{
            addVC.delegate = self
            }
        if segue.identifier == "countDownSegue",
           let countVC = segue.destination as? CountdownViewController{
            // timer index is equal certain row
            let timerIndex = tableView.indexPathForSelectedRow?.row
            let selectedTimer = timerList[timerIndex!]
                countVC.delegate = self
                // specific array is sent to count VC
                countVC.newTimer = [selectedTimer]
            }
    }
    // function to change remaining time
    func createTime(remainingTimer: String) {
        let timerIndex = tableView.indexPathForSelectedRow?.row
        // timer is changed in the array
        timerList[timerIndex!].remainingTime = remainingTimer
        self.tableView.reloadData()
    }
    // function to add the new timer
    func newTimer(addTimer: Timer) {
        // appends the new timer to the array
        timerList.append(addTimer)
        self.tableView.reloadData()
    }
    // returns the count of the timer list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timerList.count
    }
    // function to display the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! NewTimerTableViewCell
        let time = timerList[indexPath.row]
        // sets the values equal to the labels that will be displayed
        cell.eventLabel?.text = "Event      \(time.event)\n"
        cell.locationLabel?.text = "Location \(time.location)"
        cell.remaininglabel?.text = "Remaining Time(s) \(time.remainingTime)"
        return cell
    }
}

