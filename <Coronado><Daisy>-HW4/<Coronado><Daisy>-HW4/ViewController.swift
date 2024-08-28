//
// ViewController.swift
// Project: CoronadoDaisy-HW4
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 9/21/23.
//
import UIKit

// create array for operators
public let dataArray = ["Add", "Subtract", "Multiply", "Divide"]

// create array for correlating operators
public let symbolOperator = ["+", "-","*", "/"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // add outlet for the table view
    @IBOutlet weak var tableView: UITableView!
    
    // create identifiers for text cell and segue to be later used
    let textCellIdentifier = "TextCell"
    let operatorIdentifierSegue = "operatorIdentifierSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // set equal to self to set table view
        tableView.delegate = self
        tableView.dataSource = self
    }
    // return the count of dataArray
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
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
    
    // tableView function to set the row and cell and return the data from the array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
        let row = indexPath.row
        // set textLabel to dataArray for return of the cell
        cell.textLabel?.text = dataArray[row]
        return cell
    }
    // prepare for the segue to go to next controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if the identifier is == to certain segue it will show that display
        if segue.identifier == "operatorIdentifierSegue",
           // destination is set to then display calculate view controller if one of the operators is selected
           let destination = segue.destination as? calculateViewController,
           // dataArrayIndex will correlate to the operator chosen from the array
           let dataArrayIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.operatorName = dataArray[dataArrayIndex]
        }
    }
}
