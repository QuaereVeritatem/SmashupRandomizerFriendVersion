//
//  CountDownViewController.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/21/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {

    @IBOutlet weak var countdownLabel: UILabel!
    
    var myTimer: Timer = Timer()
    var count: Int = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()
            startCountdown()
            countdownReachedZero()
            //performSegue(withIdentifier: "factionRandomizedSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    func startCountdown(){
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(myUpdate), userInfo: nil, repeats: true)
        
    }
    
    func myUpdate() {
        if(count > 0) {
            count -= 1
            countdownLabel.text = "\(count)"
        } else {
            if count == 0{
            myTimer.invalidate()
            //this is where we determine which segue/sscreen we go to
                if PassableInfo.sharedInstance.assignFactionsToPlayer == false {
                    performSegue(withIdentifier: "factionRandomizedSegue", sender: self)
                } else {
                    performSegue(withIdentifier: "factionAssignedSegue", sender: self)
                    }
            }
        }

    }
    
    func countdownReachedZero(){
        if(count > 0) {
            count -= 1
            countdownLabel.text = "\(count)"
        } else {
            //code doesnt work..it never reaches this if statement
            if count == 0{
                myTimer.invalidate()
                performSegue(withIdentifier: "factionRandomizedSegue", sender: self)

            }
          }
        

    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // showDetail Segue
        if segue.identifier == "factionRandomizedSegue" {
            // Sending the image to DetailViewController
            // Before appears in the screen.
            let detailViewController = segue.destination as! FactionRandomizedViewController
            detailViewController.tempAssignFactionsToPlayer = PassableInfo.sharedInstance.assignFactionsToPlayer
            detailViewController.tempChosenPlayerNumber = PassableInfo.sharedInstance.chosenPlayerNumber
            detailViewController.tempNoRepeatFaction = PassableInfo.sharedInstance.noRepeatFaction
            detailViewController.tempPlayersPlayingArray = PassableInfo.sharedInstance.playersPlayingArray
            
        }
        
        // Go to another view controller (remove image, we want to send correct segue name and player names{and number})
        //performSegue(withIdentifier: "showDetail", sender: imageView.image)
    }
 
    
    
    
    
    

}









