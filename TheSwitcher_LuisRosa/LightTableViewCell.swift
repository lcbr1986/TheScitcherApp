//
//  LightTableViewCell.swift
//  TheSwitcher_LuisRosa
//
//  Created by Luis Carlos Rosa on 03/06/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit

class LightTableViewCell: UITableViewCell {

    @IBOutlet weak var lightSwitch: UISwitch!
    @IBOutlet weak var roomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
