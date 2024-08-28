//
// Timer.swift
// <Coronado><Daisy>-HW7
// Project: CoronadoDaisy-HW7
// EID: dc44789
// Course: CS329E
//  Created by Daisy Coronado on 10/26/23.
//
import Foundation

class Timer{
    var event: String
    var location: String
    var remainingTime: String
    
    init(event: String, location: String, remainingTime: String) {
        self.event = event
        self.location = location
        self.remainingTime = remainingTime
    }
}
