//
//  factionChosenTableViewCell.swift
//  SmashUpRandomizer
//
//  Created by Robert Martin on 6/21/17.
//  Copyright © 2017 Robert Martin. All rights reserved.
//

import UIKit

class factionChosenTableViewCell: UITableViewCell {

    @IBOutlet weak var factionImage1: UIImageView!
    
    @IBOutlet weak var factionLabel1: UILabel!
    
    @IBOutlet weak var factionImage2: UIImageView!
    
    @IBOutlet weak var factionLabel2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
