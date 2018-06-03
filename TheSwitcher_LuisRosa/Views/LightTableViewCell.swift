//
//  LightTableViewCell.swift
//  TheSwitcher_LuisRosa
//
//  Created by Luis Carlos Rosa on 03/06/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit

protocol LightTableViewCellDelegate {
    func lightDidSwitch(isOn: Bool, forIndex: Int)
}

class LightTableViewCell: UITableViewCell {

    @IBOutlet weak var lightSwitch: UISwitch!
    @IBOutlet weak var roomLabel: UILabel!
    var index: Int?
    var delegate: LightTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lightSwitch.addTarget(self, action: #selector(self.stateChanged(switchState: )), for: UIControlEvents.valueChanged)
    }

    @objc func stateChanged(switchState: UISwitch) {
        guard let index = self.index else {
            return
        }
        self.delegate?.lightDidSwitch(isOn: switchState.isOn, forIndex: index)
    }

}
