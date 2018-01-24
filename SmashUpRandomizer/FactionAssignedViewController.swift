//
//  FactionAssignedViewController.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/21/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import UIKit

class FactionAssignedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var prevNumArray: [Int] = []
    
    //this is twice the number of players..represents number of factions
    var loopTimesTwo = PassableInfo.sharedInstance.chosenPlayerNumber * 2
    
    var previousNumber: UInt32? // used in randomNumber()
    
    //possible random number: the random number before we test it for being a repeat number
    var possibleRanNum1: Int = 0
    
    var factionArrayNums: [Int] = []
    
    var nameCounter: Int = 0
  
    var randomFSet = Set<String>()
  
    var randArray: [String] = []
  
    var rE = RandomElement()
  
    @IBOutlet weak var tableView: UITableView!
    
    //this will refresh screen and choose all new factions for each player
    @IBAction func rechooseFactionBtn(_ sender: UIButton) {
      //performSegue(withIdentifier: "factionAssignedSegue", sender: PassableInfo())
      
      /*
        //reload tableview
        func reloadData() {
            //doesnnt work yet 
           // tableView.beginUpdates()
        }
        */
      
      //next line should work but instead causes app to crash
      //tableView.reloadData()
    }
    
    //this will go back to home page, reset passable info vars and user will rechoose all settings/players
    @IBAction func back2HomeBtn(_ sender: UIButton) {
      //  let segue = UIStoryboardSegue.init(identifier: "assignedToHome", source: FactionAssignedViewController, destination: HomePageMenuViewController)()
        
        
        //this will reset all vars so new players and settings must be chosen
        PassableInfo.sharedInstance.resetB4ReChoose()
        
        //this (function in the future) will change all buttons on home screen back to their default mode(grey)
        //let detailViewController = segue.destination as! HomePageMenuViewController
        
        //sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: emSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        
        //segue back home
        performSegue(withIdentifier: "assignedToHome", sender: PassableInfo())  
    }
    
    
    //var numOfPlayers: Int = 7
    
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
        
        //2 players per cell..divide player numer by 2..if even, than that number is count, if not, count is 1 more than that #
        if PassableInfo.sharedInstance.chosenPlayerNumber % 2 == 0 {
            return (PassableInfo.sharedInstance.chosenPlayerNumber / 2 )
        } else {
           return (PassableInfo.sharedInstance.chosenPlayerNumber / 2 ) + 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // This will try to reuse a cell if one can be found. If not, a new cell will be created.
        let cell = tableView.dequeueReusableCell(withIdentifier: "factionAssignedCell", for: indexPath) as! factionAssignedTableViewCell
        
        // Find out what index or row we're building for and use that to fetch the corresponding data.
        let row = (indexPath as NSIndexPath).row
        
        //5 things to output on each half of each cell!! (This should be a loop...but loop can only do 1 cell at a time!)
        
        //use randomFSet as list to print/display from [DELETE WHEN DONE]
        cell.player1.text = PassableInfo.sharedInstance.playersPlayingArray[nameCounter]
        
        nameCounter = nameCounter + 1
        
        cell.player1Faction1?.text = randArray[arrayNum]

        cell.player1FactionImage1?.image = UIImage.init(named: (cell.player1Faction1?.text)!)
        
        arrayNum = arrayNum + 1
        
        cell.player1Faction2?.text = randArray[arrayNum]
        
        cell.player1FactionImage2?.image = UIImage.init(named: (cell.player1Faction2?.text)!)
        
        arrayNum = arrayNum + 1
        
        // last display/print will be [row == (playersplaying / 2) && playersplaying % 2 == 0]...not complete yet
        if nameCounter < PassableInfo.sharedInstance.playersPlayingArray.count  {
            
            cell.player2.text = PassableInfo.sharedInstance.playersPlayingArray[nameCounter]
            
            nameCounter = nameCounter + 1
            
            cell.player2Faction1?.text = randArray[arrayNum]
            
            cell.player2FactionImage1?.image = UIImage.init(named: (cell.player2Faction1?.text)!)
            
            arrayNum = arrayNum + 1
            
            cell.player2Faction2?.text = randArray[arrayNum]
            
            cell.player2FactionImage2?.image = UIImage.init(named: (cell.player2Faction2?.text)!)

            
            arrayNum = arrayNum + 1
            }
       
        // Finally, return the cell so it can be placed into the table view.
        
        
        return cell
    }

    func randomNumber() -> UInt32 {
        
        //1st generate a random number
        var randomNumberX = arc4random_uniform(UInt32(Factions.sharedInstance.factionListArray.count))
        
        //if array already has at least one number, we must check to see if new number is a repeat
        if prevNumArray.count > 1 {
            for numCount in 0...prevNumArray.count - 1 {
                
                //if its the 2nd number or greater, check it against an array that stores all other numbers(loop)
                while prevNumArray[numCount] == Int(randomNumberX) {
                    //2b if number is repeat, re-generate a random number again(then re-test it)
                    randomNumberX = arc4random_uniform(UInt32(Factions.sharedInstance.factionListArray.count))
                }
            }
            //this will be the end of if loop (for loop will end before this
        } else {
            while previousNumber == randomNumberX {
                //2b if number is repeat, re-generate a random number again(then re-test it)
                randomNumberX = arc4random_uniform(UInt32(Factions.sharedInstance.factionListArray.count))
            }
        }
        previousNumber = randomNumberX
        
        //2c if not a repeat add it to the storage array and return number (or add it to array outside of function?)
        prevNumArray.append(Int(previousNumber!))
        Factions.sharedInstance.noRepeatNumbers.append(Int(randomNumberX))
        return randomNumberX
    }
    
  func loadData() {
    // code to load data
  }
  
  
  
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
/*
extension UITableView {
  func refreshTable() {
    let indexPathForSection = NSIndexSet(
  }
}
*/







