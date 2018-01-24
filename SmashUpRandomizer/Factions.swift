//
//  Factions.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/21/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import Foundation

class Factions {
    //only one instance can be created [singleton]
    static let sharedInstance = Factions()
    
    var noRepeatNumbers: [Int] = []
    
    // Total list of all Factions through the latest "What were we thinking?" expansion pack
    //(50 factions so far)
    let factionListArray: [String] = [
        "Aliens", "Dinosaurs", "Ninjas", "Pirates", "Robots", "Wizards", "Tricksters",
        "Zombies", "Bear Cavalry", "Ghosts", "Killer Plants", "Steampunks",
        "Elder Things", "Innsmouth", "Minions of Cthulhu", "Miskatonic University",
        "Cyborg Apes", "Shape Shifters", "Super Spies", "Time Travelers",
        "Giant Ants", "Vampires", "Mad Scientists", "Werewolves",
        "Geeks", "Fairies", "Kitty Cats", "Mythic Horses",
        "Princesses", "Dwarves", "Elves", "Clerics",
        "Halflings", "Mages", "Orcs", "Thieves", "Warriors", "Dragons",
        "Mythic Greeks", "Sharks", "Superheroes", "Tornados", "AstroKnights",
        "Star Roamers", "Changer Bots", "IgNobles", "Explorers", "Grannies", "Rock Stars", "Teddy Bears", "All Stars",
        "Magical Girls", "Mega Troopers", "Itty Critters", "Kaiju"]
    

    }

extension Array
{
    func random() -> Int
    {
       
        var temp = Int(arc4random_uniform(UInt32(self.count)))
        return temp
    }
}
