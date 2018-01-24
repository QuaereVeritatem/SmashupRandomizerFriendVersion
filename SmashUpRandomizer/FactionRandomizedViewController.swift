//
//  FactionRandomizedViewController.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/21/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import UIKit

//issues: Pulling down on table to refresh gets you new factions.. and could get you out of array/index..could be done by accident

class FactionRandomizedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var cellCount = 0
    
    var prevNumArray: [Int] = []
  
    var randomFSet = Set<String>()
  
    var randArray: [String] = []
  
    var rE = RandomElement()
  
    //this is twice the number of players..represents number of factions
    var loopTimesTwo = PassableInfo.sharedInstance.chosenPlayerNumber * 2
    
    var previousNumber: UInt32? // used in randomNumber()
    
    //possible random number: the random number before we test it for being a repeat number
    var possibleRanNum1: Int = 0
    
    //possible random number: the random number before we test it for being a repeat number
    var possibleRanNum2: Int = 0
    
    //this will be the names of all the players who have been selected to play on home/menu screen
    var tempPlayersPlayingArray: [String] = []
    
    //the number of players who have been chosen to play
    var tempChosenPlayerNumber: Int = 0
    
    //This will tell if Assigning factions to player option has been selected
    var tempAssignFactionsToPlayer: Bool = false
    
    //This will tell if no repeat faction option has been selected
    //If this is true, then we will store all factions that are generated so there are no repeats
    var tempNoRepeatFaction: Bool = false
    
    var factionArrayNums: [Int] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    //this wil refresh screen and choose new factions for same players
    @IBAction func rechooseFactionBtn(_ sender: UIButton) {
      //next line shold work but instead causes app to crash
      //tableView.reloadData()
    }
    
    //this will go back to home page, reset passable info vars and user will rechoose all settings/players
    @IBAction func back2HomeBtn(_ sender: UIButton) {
        
        //this will reset all vars so new players and settings must be chosen
        PassableInfo.sharedInstance.resetB4ReChoose()
        //segue back home
        performSegue(withIdentifier: "randomizedToHome", sender: PassableInfo())
    }
    
    
    var numOfPlayers: Int = 7
    //**WARNING This will be reset to 0 when you come back to this page
    var arrayNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this will save the random factions generated from Random Element to randArray
        randArray = rE.randomFactions(playerNum: PassableInfo.sharedInstance.chosenPlayerNumber)
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // We only have one section in our table view.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // The number of rows we want for our table view is directly related to
        // the number of data entries we have in our data array.
        
        return tempChosenPlayerNumber

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // This will try to reuse a cell if one can be found. If not, a new cell will be created.
        let cell = tableView.dequeueReusableCell(withIdentifier: "factionChosenCell", for: indexPath) as! factionChosenTableViewCell
        
        // Find out what index or row we're building for and use that to fetch the corresponding data.
        let row = (indexPath as NSIndexPath).row
        
        cell.factionLabel1?.text = randArray[cellCount]
        cell.factionImage1?.image = UIImage.init(named: (cell.factionLabel1?.text)!)
        
        print ("The \(cellCount) element/label is \(randArray[cellCount]) ")
        if cellCount < randArray.count {
          cellCount = cellCount + 1
        }
        cell.factionLabel2?.text = randArray[cellCount]

        cell.factionImage2?.image = UIImage.init(named: (cell.factionLabel2?.text)!)
        print ("The next or \(cellCount) element/label is \(randArray[cellCount]) ")
        if cellCount < randArray.count {
          cellCount = cellCount + 1
        }
        // Finally, return the cell so it can be placed into the table view.
        return cell
    }
  
  //dont need this anymore since we implemented sets
    func checkForRepeats(tempNum:Int) -> Int {
        var numberBad: Bool = false
        
        //check incoming number if its in repeat array ()
        for i in 0...factionArrayNums.count - 1 {
            //test to see if number was used already (locally and for this viewcontroller only)
            if tempNum == i {
                numberBad = true
            }
        }
        //if numberBad false return number since its good, else re-generate a random number
        if numberBad == false {
            return tempNum
        } else {
            print("Number \(tempNum) bad..checking for new number...")
           return checkForRepeats(tempNum: Factions.sharedInstance.factionListArray.random())
        }
        
    }
    
    
    func randomNumber() -> UInt32 {
        
        //1st generate a random number
        var randomNumber = arc4random_uniform(UInt32(Factions.sharedInstance.factionListArray.count))
        
        //if array already has at least one number, we must check to see if new number is a repeat
        if prevNumArray.count > 1 {
            for numCount in 0...prevNumArray.count - 1 {
           
                //if its the 2nd number or greater, check it against an array that stores all other numbers(loop)
                while prevNumArray[numCount] == Int(randomNumber) {
                    //2b if number is repeat, re-generate a random number again(then re-test it)
                    randomNumber = arc4random_uniform(UInt32(Factions.sharedInstance.factionListArray.count))
                }
            }
        //this will be the end of if loop (for loop will end before this
        } else {
            while previousNumber == randomNumber {
                //2b if number is repeat, re-generate a random number again(then re-test it)
                randomNumber = arc4random_uniform(UInt32(Factions.sharedInstance.factionListArray.count))
            }
        }
        previousNumber = randomNumber
        
        //2c if not a repeat add it to the storage array and return number (or add it to array outside of function?)
        prevNumArray.append(Int(previousNumber!))
        Factions.sharedInstance.noRepeatNumbers.append(Int(randomNumber))
        return randomNumber
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
