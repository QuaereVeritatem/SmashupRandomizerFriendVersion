//
//  PassableInfo.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/22/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import Foundation

class PassableInfo {
    //only one instance can be created [singleton]
    static let sharedInstance = PassableInfo()

    //this will be the names of all the players who have been selected to play on home/menu screen
    var playersPlayingArray: [String] = []
    
    //the number of players who have been chosen to play
    var chosenPlayerNumber: Int = 0
    
    //this will store all chosen factions that are generated(stored as an array of numbers)
    var pastChosenFactions: [Int] = []
    
    //This will tell if Assigning factions to player option has been selected
    var assignFactionsToPlayer: Bool = false
    
    //This will tell if no repeat faction option has been selected 
    //If this is true, then we will store all factions that are generated so there are no repeats
    var noRepeatFaction: Bool = false
    
    //this shows if the class has been edited at all(we dont want randomize to work before we select players)
    var hasBeenEdited: Bool = false
    
    //This is a list off all the possible segue names as an enum
    enum Segue: String {
        case toCountdown, factionAssignedSegue, factionRandomizedSegue, randomizedToHome, assignedToHome
    }
    
    func resetB4ReChoose() {
        playersPlayingArray = []
        chosenPlayerNumber = 0
        assignFactionsToPlayer = false
        noRepeatFaction = false
        hasBeenEdited = false
        
    }
    
    
}
