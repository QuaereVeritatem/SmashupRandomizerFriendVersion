//
//  factionAssignedTableViewCell.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/21/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import UIKit

class factionAssignedTableViewCell: UITableViewCell {

    @IBOutlet weak var player1: UILabel!
    
    @IBOutlet weak var player1Faction1: UILabel!
    
    @IBOutlet weak var player1FactionImage1: UIImageView!
    
    @IBOutlet weak var player1Faction2: UILabel!
    
    @IBOutlet weak var player1FactionImage2: UIImageView!
    
    
    
    @IBOutlet weak var player2: UILabel!
    
    @IBOutlet weak var player2Faction1: UILabel!
    
    @IBOutlet weak var player2FactionImage1: UIImageView!
    
    @IBOutlet weak var player2Faction2: UILabel!
    
    @IBOutlet weak var player2FactionImage2: UIImageView!
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
