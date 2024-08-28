//
// DetailViewController.swift
// <Coronado><Daisy>-HW10
// Filename: CoronadoDaisy-HW10
// EID: dc44789
// Course: CS329E
// Created by Daisy Coronado on 11/28/23.
//
import UIKit

class DetailViewController: UIViewController {
    // var for new image
    var newImage:UIImage = UIImage()
    // out let for imageview
    @IBOutlet weak var nextView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //scale the image to fit measurements
        nextView.contentMode = .scaleAspectFit
        nextView.image = newImage
    }
}
