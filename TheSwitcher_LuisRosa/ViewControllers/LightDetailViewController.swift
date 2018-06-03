//
//  LightDetailViewController.swift
//  TheSwitcher_LuisRosa
//
//  Created by Luis Carlos Rosa on 03/06/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit

class LightDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    var light: Light?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let light = self.light else {
            return
        }
        self.title = light.division
        
        if light.isOn {
            imageView.image = UIImage(named: "light_image_ON")
            stateLabel.text = "ON"
        } else {
            imageView.image = UIImage(named: "light_image_OFF")
            stateLabel.text = "OFF"
        }
        roomLabel.text = "Your \(light.division) light is"
    }

}
