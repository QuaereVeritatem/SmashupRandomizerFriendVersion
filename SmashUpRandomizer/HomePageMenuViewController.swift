//
//  HomePageMenuViewController.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/21/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

// will crash when you pull down to manually reuse/refresh cells [NEED TO FIX]
// crash when you choose "re-choose factions" [NEED TO FIX]
// need to program last feature of "no repeat factions today"
// sounds depending on who you choose
// program Ross as a player
// clean codify, including changing repeating code within buttons to functions

import UIKit

class HomePageMenuViewController: UIViewController {
    
    let image = UIImage(named: "NotChosenRectangle.png")
    //emmaSelected.setBackgroundImage(image, for: .normal)
    //emmaSelected.setImage(UIImage(named: "NotChosenRectangle")?.withRenderingMode(.alwaysOriginal), for: .normal)
    
    //this is NOT the proper way to do THIS (dont use global vars to toggle selected buttons)
    var emSelected: Bool = false
    var jaSelected: Bool = false
    var alSelected: Bool = false
    var crSelected: Bool = false
    var roSelected: Bool = false
    var stSelected: Bool = false
    var jeSelected: Bool = false

    var assignSelected:   Bool = false
    var noRepeatSelected: Bool = false

    //needed to unwind back to this screen
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    //each button should 1) change button image when selected, 2) update PassableInfo 3) test to see which image should be used(selected or de-selected image) 4) possible trademark sound(for selection only) 5)**Must UNDUE when deselected!
    @IBAction func emmaSelected(_ sender: UIButton, forEvent event: UIEvent) {
        
        //This changed the state of the bool variable (false for not selected, true for seleted)
        if emSelected == false {
            emSelected = true
        } else {
            emSelected = false
        }
        //this func will change button image based on state of selection(1&3)
        sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: emSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //this func will update PassableInfo (and the class was edited var)(2)
        PassableInfo.sharedInstance.playersPlayingArray.append(PlayerNames.sharedInstance.playerListArray[0])
        
        //this adds to the player chosen count (will add even if de-selected and re-selected)
        PassableInfo.sharedInstance.chosenPlayerNumber = PassableInfo.sharedInstance.chosenPlayerNumber + 1
        
        //this shows we have edited the PassableInfo class
        PassableInfo.sharedInstance.hasBeenEdited = true
        
        //this future func will play unique sound if selecting button wasnt selected before
        
    }

    @IBAction func jacobSelected(_ sender: UIButton, forEvent event: UIEvent) {
        
        //This changed the state of the bool variable (false for not selected, true for seleted)
        if jaSelected == false {
            jaSelected = true
        } else {
            jaSelected = false
        }
        //this func will change button image based on state of selection(1&3)
        sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: jaSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //this func will update PassableInfo (and the class was edited var)(2)
        PassableInfo.sharedInstance.playersPlayingArray.append(PlayerNames.sharedInstance.playerListArray[1])
        
        //this adds to the player chosen count (will add even if de-selected and re-selected)
        PassableInfo.sharedInstance.chosenPlayerNumber = PassableInfo.sharedInstance.chosenPlayerNumber + 1
        
        //this shows we have edited the PassableInfo class
        PassableInfo.sharedInstance.hasBeenEdited = true
        
        //this future func will play unique sound if selecting button wasnt selected before
        

    }
    
    @IBAction func alexanderSelected(_ sender: UIButton, forEvent event: UIEvent) {
        
        //This changed the state of the bool variable (false for not selected, true for seleted)
        if alSelected == false {
            alSelected = true
        } else {
            alSelected = false
        }
        //this func will change button image based on state of selection(1&3)
        sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: alSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //this func will update PassableInfo (and the class was edited var)(2) ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.playersPlayingArray.append(PlayerNames.sharedInstance.playerListArray[2])
        
        //this adds to the player chosen count (will add even if de-selected and re-selected)
        PassableInfo.sharedInstance.chosenPlayerNumber = PassableInfo.sharedInstance.chosenPlayerNumber + 1
        
        //this shows we have edited the PassableInfo class  ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.hasBeenEdited = true
        
        //this future func will play unique sound if selecting button wasnt selected before
        

    }
    
    @IBAction func craigSelected(_ sender: UIButton, forEvent event: UIEvent) {
        
        //This changed the state of the bool variable (false for not selected, true for seleted)
        if crSelected == false {
            crSelected = true
        } else {
            crSelected = false
        }
        //this func will change button image based on state of selection(1&3)
        sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: crSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //this func will update PassableInfo (and the class was edited var)(2) ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.playersPlayingArray.append(PlayerNames.sharedInstance.playerListArray[3])
        
        //this adds to the player chosen count (will add even if de-selected and re-selected)
        PassableInfo.sharedInstance.chosenPlayerNumber = PassableInfo.sharedInstance.chosenPlayerNumber + 1
        
        //this shows we have edited the PassableInfo class  ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.hasBeenEdited = true
        
        //this future func will play unique sound if selecting button wasnt selected before
        

    }
    
    @IBAction func robertSelected(_ sender: UIButton, forEvent event: UIEvent) {
        
        //This changed the state of the bool variable (false for not selected, true for seleted)
        if roSelected == false {
            roSelected = true
        } else {
            roSelected = false
        }
        //this func will change button image based on state of selection(1&3)
        sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: roSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //this func will update PassableInfo (and the class was edited var)(2) ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.playersPlayingArray.append(PlayerNames.sharedInstance.playerListArray[4])
        
        //this adds to the player chosen count (will add even if de-selected and re-selected)
        PassableInfo.sharedInstance.chosenPlayerNumber = PassableInfo.sharedInstance.chosenPlayerNumber + 1
        
        //this shows we have edited the PassableInfo class  ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.hasBeenEdited = true
        
        //this future func will play unique sound if selecting button wasnt selected before
        

    }
    
    @IBAction func stevenSelected(_ sender: UIButton, forEvent event: UIEvent) {
        
        //This changed the state of the bool variable (false for not selected, true for seleted)
        if stSelected == false {
            stSelected = true
        } else {
            stSelected = false
        }
        //this func will change button image based on state of selection(1&3)
        sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: stSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //this func will update PassableInfo (and the class was edited var)(2) ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.playersPlayingArray.append(PlayerNames.sharedInstance.playerListArray[5])
        
        //this adds to the player chosen count (will add even if de-selected and re-selected)
        PassableInfo.sharedInstance.chosenPlayerNumber = PassableInfo.sharedInstance.chosenPlayerNumber + 1
        
        //this shows we have edited the PassableInfo class  ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.hasBeenEdited = true
        
        //this future func will play unique sound if selecting button wasnt selected before
        

    }
    
    @IBAction func jeannieSelected(_ sender: UIButton, forEvent event: UIEvent) {
        
        //This changed the state of the bool variable (false for not selected, true for seleted)
        if jeSelected == false {
            jeSelected = true
        } else {
            jeSelected = false
        }
        //this func will change button image based on state of selection(1&3)
        sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: jeSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //this func will update PassableInfo (and the class was edited var)(2) ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.playersPlayingArray.append(PlayerNames.sharedInstance.playerListArray[6])
        
        //this adds to the player chosen count (will add even if de-selected and re-selected)
        PassableInfo.sharedInstance.chosenPlayerNumber = PassableInfo.sharedInstance.chosenPlayerNumber + 1
        
        //this shows we have edited the PassableInfo class  ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.hasBeenEdited = true
        
        //this future func will play unique sound if selecting button wasnt selected before
        

    }
    
    
    @IBAction func assignFactions2Players(_ sender: UIButton, forEvent event: UIEvent) {
        
        //This changed the state of the bool variable (false for not selected, true for seleted)
        if assignSelected == false {
            assignSelected = true
        } else {
            assignSelected = false
        }
        
        //this func will change button image based on state of selection(1&3)
        sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: assignSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)

        //this func will update PassableInfo (and the class was edited var)(2) ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.assignFactionsToPlayer = true
        
        //this shows we have edited the PassableInfo class  ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.hasBeenEdited = true
        
        //this future func will play unique sound if selecting button wasnt selected before
        


    }
    
    @IBAction func noRepeatFactionSelected(_ sender: UIButton, forEvent event: UIEvent) {
        
        //This changed the state of the bool variable (false for not selected, true for seleted)
        if noRepeatSelected == false {
            noRepeatSelected = true
        } else {
            noRepeatSelected = false
        }
        
        //this func will change button image based on state of selection(1&3)
        sender.setImage(UIImage(named: isButtonSelected(tempButton: sender, tempBool: noRepeatSelected))?.withRenderingMode(.alwaysOriginal), for: .normal)

        //this func will update PassableInfo (and the class was edited var)(2) ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.noRepeatFaction = true
        
        //this shows we have edited the PassableInfo class  ****(this doesnt work when de-selected)
        PassableInfo.sharedInstance.hasBeenEdited = true
        
        //this future func will play unique sound if selecting button wasnt selected before
        


    }
    
    
    @IBAction func randomizeButton(_ sender: UIButton, forEvent event: UIEvent) {
        if PassableInfo.sharedInstance.hasBeenEdited == true {
            //send all info from PassableInfo and segue
            //var CountDownViewController = PassableInfo.Segue.toCountdown as! CountDownViewController
           // CountDownViewController.P = sender as? UIImage
            
            //segue
            performSegue(withIdentifier: PassableInfo.Segue.toCountdown.rawValue, sender: PassableInfo())
        } else {
            //dont segue..nothing happens when you press the button
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //change all buttons to default grey if hasBeenEdited is false
        if PassableInfo.sharedInstance.hasBeenEdited == false {
            
            //change all buttons to default here
            //emmaSelected(<#T##sender: UIButton##UIButton#>, forEvent: <#T##UIEvent#>)
            let image = UIImage(named: "imagename.png")
            //emmaSelected.setBackgroundImage(image, for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    //this function will determine if button is or isnt selected then change the image to reflect that
    func isButtonSelected(tempButton: UIButton, tempBool: Bool) -> String {
        
        var buttonImageName: String
        
        //if selected var true then switch to "ChosenPlayewrStar&Square", if false switch to "Rectangle 3"
        if tempBool == false {
            
           buttonImageName = "Rectangle 3"
        } else {
            
           buttonImageName = "ChosenPlayewrStar&Square"
        }
        
      
        return buttonImageName
    }
    
    func updatePassableInfo() {
        
        
    }

    /*
    // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     
     // showDetail Segue
     if segue.identifier == "showDetail" {
     // Sending the image to DetailViewController
     // Before appears in the screen.
     let detailViewController = segue.destination as! DetailViewController
     detailViewController.image = sender as? UIImage
     }
     
     // Go to another view controller (remove image, we want to send correct segue name and player names{and number})
     //performSegue(withIdentifier: "showDetail", sender: imageView.image)
     }
    */

}
