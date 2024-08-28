//
// NewTimerTableViewCell.swift
// <Coronado><Daisy>-HW7
// Project: CoronadoDaisy-HW7
// EID: dc44789
// Course: CS329E
//  Created by Daisy Coronado on 10/27/23.
//
import UIKit

class NewTimerTableViewCell: UITableViewCell {
    // outlets for location, event, and remaining for table view
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var remaininglabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
