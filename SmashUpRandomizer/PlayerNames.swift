//
//  PlayerNames.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/22/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import Foundation

class PlayerNames {
    //only one instance can be created [singleton]
    static let sharedInstance = PlayerNames()
    
    //Player Names who play alot
    let playerListArray: [String] = [
        "Emma", "Jacob", "Alexander", "Craig", "Robert", "Steven", "Jeannie"
        ]
    
    
    
}

//Name choices to be used in protocol later
enum nameChoice: String {
  case Emma
  case Jacob
  case Alexander
  case Craig
  case Robert
  case Steven
  case Jeannie
  case Ross
  case unknown
  
  var name: String {
    switch self {
    case .Emma:
      return "Emma"
    case .Jacob:
      return "Jacob"
    case .Alexander:
      return "Alexander"
    case .Craig:
      return "Craig"
    case .Robert:
      return "Robert"
    case .Steven:
      return "Steven"
    case .Jeannie:
      return "Jeannie"
    case .Ross:
      return "Ross"
    case .unknown:
      return "Is a new player playing whos not on the list? Try again"
    }
  }
}

//make a protocol for players to replace the class "PlayerNames" here
protocol Player {
    var name: String { get set }
}

//set up so name lets you choose from all options in nameChoice enum
extension Player {
  //var name: nameChoice
}









