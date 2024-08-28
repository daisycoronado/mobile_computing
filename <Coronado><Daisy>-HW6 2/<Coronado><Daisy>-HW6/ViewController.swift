//
// ViewController.swift
// Project: CoronadoDaisy-HW6
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 10/4/23.
//
import UIKit
import FirebaseAuth
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

// create pizza class to store size, and other toppings for the pizza
class orderPizza{
    var pSize:String = "small"
    var crust: String
    var cheese: String
    var meat: String
    var veggies: String
    
    // init the values
    init(pSize:String, crust:String, cheese:String, meat:String, veggies:String) {
        // set the values
        self.pSize = pSize
        self.crust = crust
        self.cheese = cheese
        self.meat = meat
        self.veggies = veggies
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PizzaChanger{
    
    // create outlet for the table view
    @IBOutlet weak var tableView: UITableView!
    
    // create pizzaList to store the pizza and be used to show in table
    var pizzaList: [orderPizza] = []
    var delegate: UIViewController!
    
    //create identifiers for text cell and segue to be later used
    let orderIdentifierSegue = "orderIdentifierSegue"
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // set equal to self to set table view
        tableView.delegate = self
        tableView.dataSource = self
        pizzaCoreData()
    }
    func pizzaCoreData() {
        // fetch results from retrive pizza
        let fetchedResults = retrivePizza()
        // for pizza in fetched results
        for pizza in fetchedResults {
            //let pizza things == the value fetched
            if let pSize = pizza.value(forKey: "pSize") {
                if let crust = pizza.value(forKey: "crust") {
                    if let cheese = pizza.value(forKey: "cheese") {
                        if let meat = pizza.value(forKey: "meat") {
                            if let veggies = pizza.value(forKey: "veggies") {
                                // append created pizza
                                pizzaList.append(orderPizza(pSize: pSize as! String, crust: crust as! String, cheese: cheese as! String, meat: meat as! String, veggies: veggies as! String))
                            }
                        }
                    }
                }
            }
        }
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
        cell.textLabel?.text = "\(pizzaList[row].pSize)\n\t\(String(describing: pizzaList[row].crust))\n\t\(String(describing: pizzaList[row].cheese))\n\t\(String(describing: pizzaList[row].meat))\n\t\(String(describing: pizzaList[row].veggies))"
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let fetchedResults = retrivePizza()
            // delete the fetched result if user wants to from the table view
            context.delete(fetchedResults[indexPath.row])
            pizzaList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    // function is used to show the new pizza that was created and append it to the list
    func pizzaOrder(newPizza: orderPizza) {
        // appends the new pizza and reloads it
        storePizza(pSize: newPizza.pSize, crust: newPizza.crust, cheese: newPizza.cheese, meat: newPizza.meat, veggies: newPizza.veggies)
        pizzaList.append(newPizza)
        self.tableView.reloadData()
    }

    func clearCoreData() {
        // erase everything currently in Core Data
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Pizza")
        var fetchedResults:[NSManagedObject]
        do {
            try fetchedResults = context.fetch(request) as! [NSManagedObject]
        
            if fetchedResults.count > 0 {
                for result in fetchedResults {
                    context.delete(result)
                }
            }
            saveContext()
        // if core data could not be cleared
        } catch {
            print("Error occurred while clearing data")
            abort()
        }
    }
    // function stores the pizza with the toppings and size
    func storePizza(pSize: String, crust: String, cheese: String, meat: String, veggies: String) {
        // pizza == the entity created being pizza
        let pizza = NSEntityDescription.insertNewObject(
            forEntityName: "Pizza",
            into: context)
        // set the pizza values == to the toppings form entity
        pizza.setValue(pSize, forKey: "pSize")
        pizza.setValue(crust, forKey: "crust")
        pizza.setValue(cheese, forKey: "cheese")
        pizza.setValue(meat, forKey: "meat")
        pizza.setValue(veggies, forKey: "veggies")
        
        saveContext()
        
    }
    // function is to retrive the pizza form object
    func retrivePizza() -> [NSManagedObject]{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Pizza")
        var fetchedResults:[NSManagedObject]? = nil
        do {
            try fetchedResults = context.fetch(request) as? [NSManagedObject]
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        return (fetchedResults)!
    }
    // saves the changes
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // if error occurs
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
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
    // if sign out button is pressed
    @IBAction func signoutButton(_ sender: Any) {
        // will sign the user out
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true)
        // if theres a problem then it will print a sing out error
        } catch {
            print("Sign out error")
        }
    }
}
