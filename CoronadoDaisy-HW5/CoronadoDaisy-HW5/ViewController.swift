//
// ViewController.swift
// Project: CoronadoDaisy-HW5
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 10/4/23.
//
import UIKit

// create pizza class to store size, and other toppings for the pizza
class Pizza{
    var pSize:String = "small"
    var crust: String?
    var cheese: String?
    var meat: String?
    var veggies: String?
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PizzaChanger{
    
    // create outlet for the table view
    @IBOutlet weak var tableView: UITableView!
    
    // create pizzaList to store the pizza and be used to show in table
    var pizzaList = [String]()
    
    //create identifiers for text cell and segue to be later used
    let orderIdentifierSegue = "orderIdentifierSegue"
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // set equal to self to set table view
        tableView.delegate = self
        tableView.dataSource = self
    }
    //return the count of dataArray
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaList.count
    }
    // tableView function to set the row and cell and return the data from the array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath as IndexPath)
        let row = indexPath.row
        // set textLabel to pizzaList for return of the cell
        cell.textLabel?.text = pizzaList[row]
        return cell
    }
    // prepare for the segue to go to next controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if the identifier is == to certain segue it will show that display
        if segue.identifier == "orderIdentifierSegue",
           // let createVC = the wanted controller being PizzaViewController
           let createVC = segue.destination as? PizzaViewController{
            createVC.delegate = self
            }
    }
    // function is used to show the new pizza that was created and append it to the list
    func pizzaOrder(newPizza: String) {
        pizzaList.append(newPizza)
        tableView.reloadData()
    }
}
