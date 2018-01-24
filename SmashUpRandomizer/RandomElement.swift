//
//  RandomElement.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/23/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import Foundation

class RandomElement {
  
  let names = Factions.sharedInstance.factionListArray
  //assigns a random name from faction list array to random
  var random = Factions.sharedInstance.factionListArray[Int(arc4random_uniform(UInt32(Factions.sharedInstance.factionListArray.count)))]
  // because printing with set is a pain int the ass
  var randomArray: [String] = []
  
  // this will be a set [so only unique factions can be in this (no duplicates)]
  var randomFactionSet = Set<String>()
  
  // this will ask for the number of players and return a set with twice as many random factions as players
  func randomFactions(playerNum: Int) -> [String] {
    //this will loop until designated number of factions have been added
    while randomFactionSet.count < (playerNum * 2) {
      let randomNumber = arc4random_uniform(UInt32(names.count))
      let randomName = names[Int(randomNumber)]
      print(randomName)
      // if the newly generated random faction isnt already apart of set then we can add it to the array then add it to the set
      if !randomFactionSet.contains(randomName) {
        randomArray.append(randomName)
      }
      randomFactionSet.insert(randomName)
      
    }
    return randomArray
  }
  
}


