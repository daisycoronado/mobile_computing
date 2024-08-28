//
// ViewController.swift
// Project: CoronadoDaisy-HW6
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 10/5/23.
//
import UIKit

class PizzaViewController: UIViewController {
    // connect the seg control and label to controller and allow
    // for further usage in functions
    @IBOutlet weak var segCtrl: UISegmentedControl!
    @IBOutlet weak var createdPizzaLabel: UILabel!
    
    // delegate for main VC and create totalPizza, which holds string
    // to be displayed into table
    var delegate: UIViewController!
    var totalPizza = ""
    
    // create all the variables as strings to be used for the functions
    var pizzaSize: String = "small"
    var pizzaCrust: String = ""
    var pizzaVeggies: String = ""
    var pizzaMeat: String = ""
    var pizzaCheese: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // set the label to an empty string so it can be added on to
        // when pizza is created
        createdPizzaLabel.text = ""
    }
    
    // this function works when the segment is changed
    @IBAction func sizeChange(_ sender: Any) {
        // when the segment is changed it can go based on case to corrrelate size
        switch segCtrl.selectedSegmentIndex {
        case 0:
            self.pizzaSize = "small"
        case 1:
            self.pizzaSize = "medium"
        case 2:
            self.pizzaSize = "large"
        default:
            self.pizzaSize = "small"
        }
    }
    
    // this function works when the crust button is pressed
    @IBAction func crustButton(_ sender: Any) {
        // user can choose crust using .alert controller
        let controller = UIAlertController(
            title: "Select crust",
            message: "Choose a crust type:",
            preferredStyle: .alert)
        // if option is selcted it will store the option as pizzaCrust
        let thinCrust = UIAlertAction(
            title: "Thin crust",
            style: .default,
            handler: {[self](action) in pizzaCrust = "thin crust"}) // sets new pizzaCrust
        controller.addAction(thinCrust)
        
        let thickCrust = UIAlertAction(
            title: "Thick crust",
            style: .default,
            handler: {[self](action) in pizzaCrust = "thick crust"}) // sets new pizzaCrust
        controller.addAction(thickCrust)
    present(controller, animated: true, completion: nil)
    }
    
    // this function works when the cheese button is pressed
    @IBAction func cheeseButton(_ sender: Any) {
        // user can choose cheese using .actionSheet controller
        let controller = UIAlertController(
            title: "Select cheese",
            message: "Choose a cheese type:",
            preferredStyle: .actionSheet)
        // if option is selcted it will store the option as pizzaCheese
        let regCheese = UIAlertAction(
            title: "Regular cheese",
            style: .default,
            handler: {[self](action) in pizzaCheese = "regular cheese"}) // sets new pizzaCheese
        controller.addAction(regCheese)
        
        let noCheese = UIAlertAction(
            title: "No cheese",
            style: .default,
            handler: {[self](action) in pizzaCheese = "no cheese"}) // sets new pizzaCheese
        controller.addAction(noCheese)
        
        let doubleCheese = UIAlertAction(
            title: "Double cheese",
            style: .default,
            handler: {[self](action) in pizzaCheese = "double cheese"}) // sets new pizzaCheese
        controller.addAction(doubleCheese)
    present(controller, animated: true, completion: nil)
    }
    
    // this function works when the meat button is pressed
    @IBAction func meatButton(_ sender: Any) {
        // user can choose meat using .actionSheet controller
        let controller = UIAlertController(
            title: "Select meat",
            message: "Choose one meat:",
            preferredStyle: .actionSheet)
        // if option is selcted it will store the option as pizzaMeat
        let pepTop = UIAlertAction(
            title: "Pepperoni",
            style: .default,
            handler: {[self](action) in pizzaMeat = "pepperoni"})
        controller.addAction(pepTop)
                                          
        let sausageTop = UIAlertAction(
            title: "Sausage",
            style: .default,
            handler: {[self](action) in pizzaMeat = "sausage"})
        controller.addAction(sausageTop)
        
        let baconTop = UIAlertAction(
            title: "Canadian Bacon",
            style: .default,
            handler: {[self](action) in pizzaMeat = "canadian bacon"})
        controller.addAction(baconTop)
    present(controller, animated: true, completion: nil)
    }
    
    // this function works when the veggie button is pressed
    @IBAction func veggieButton(_ sender: Any) {
        // user can choose veggie using .actionSheet controller
        let controller = UIAlertController(
            title: "Select veggies",
            message: "Choose your veggies:",
            preferredStyle: .actionSheet)
        // if option is selcted it will store the option as pizzaVeggie
        let mushroomVeg = UIAlertAction(
            title: "Mushroom",
            style: .default,
            handler: {[self](action) in pizzaVeggies = "mushroom"})
        controller.addAction(mushroomVeg)
        
        let onionVeg = UIAlertAction(
            title: "Onion",
            style: .default,
            handler: {[self](action) in pizzaVeggies = "onion"})
        controller.addAction(onionVeg)
        
        let greenVeg = UIAlertAction(
            title: "Green Olive",
            style: .default,
            handler: {[self](action) in pizzaVeggies = "green olive"})
        controller.addAction(greenVeg)
        
        let blackVeg = UIAlertAction(
            title: "Black Olive",
            style: .default,
            handler: {[self](action) in pizzaVeggies = "black olive"})
        controller.addAction(blackVeg)
        
        let noneVeg = UIAlertAction(
            title: "None",
            style: .default,
            handler: {[self](action) in pizzaVeggies = "none"})
        controller.addAction(noneVeg)
    present(controller, animated: true, completion: nil)
    }
    
    // this function works when the done button is pressed
    @IBAction func createPizzaButton(_ sender: Any) {
        // check to see if the variables are empty
        // if one of the variables is missing it will present an alert for which one is missing
        if (pizzaCrust.isEmpty) {
            let controller = UIAlertController(
                title: "Missing ingredient",
                message: "Please select a crust type:", // if empty it will print the missing ingredient
                preferredStyle: .alert)
            controller.addAction(UIAlertAction(
                title: "OK",
                style: .default))
            present(controller, animated: true, completion: nil)
        } else if (pizzaCheese.isEmpty) {
            let controller = UIAlertController(
                title: "Missing ingredient",
                message: "Please select a cheese type:", // if empty it will print the missing ingredient
                preferredStyle: .alert)
            controller.addAction(UIAlertAction(
                title: "OK",
                style: .default))
            present(controller, animated: true, completion: nil)
        } else if (pizzaMeat.isEmpty) {
            let controller = UIAlertController(
                title: "Missing ingredient",
                message: "Please select a meat:", // if empty it will print the missing ingredient
                preferredStyle: .alert)
            controller.addAction(UIAlertAction(
                title: "OK",
                style: .default))
            present(controller, animated: true, completion: nil)
        } else if (pizzaVeggies.isEmpty){
            let controller = UIAlertController(
                title: "Missing ingredient",
                message: "Please select a veggie:", // if empty it will print the missing ingredient
                preferredStyle: .alert)
            controller.addAction(UIAlertAction(
                title: "OK",
                style: .default))
            present(controller, animated: true, completion: nil)
        }else{
            let pizza = orderPizza(pSize: pizzaSize, crust: pizzaCrust, cheese: pizzaCheese, meat: pizzaMeat, veggies: pizzaVeggies)
            // if no ingredients are misisng it will print the result
            let result = "One \(pizzaSize) pizza with:\n\t\(pizzaCrust)\n\t\(pizzaCheese)\n\t\(pizzaMeat)\n\t\(pizzaVeggies)"
            createdPizzaLabel.text = result
            
            //store the totalPizza so it can be used in the main controller and put in the table
            self.totalPizza = "\(pizzaSize)\n\t\(pizzaCrust)\n\t\(pizzaCheese)\n\t\(pizzaMeat)\n\t\(pizzaVeggies)"
            let mainVC = delegate as! PizzaChanger
            mainVC.pizzaOrder(newPizza: pizza)
        }
    }
}
