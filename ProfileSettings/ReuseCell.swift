//
//  ReuseCell.swift
//  ProfileSettings
//
//  Created by Appinventiv on 08/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ReuseCell: UITableViewCell {
   
    @IBOutlet weak var basicDetailsLabel: UILabel!
    @IBOutlet weak var informationTF: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
