//
//  ViewController.swift
//  TheSwitcher_LuisRosa
//
//  Created by Luis Carlos Rosa on 03/06/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lights:[Light] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lights = [Light(divisionName: "Kitchen"), Light(divisionName: "Living room", isOn: true), Light(divisionName: "Master bedroom"), Light(divisionName: "Guest’s bedroom")]
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lightCell", for: indexPath) as! LightTableViewCell
        cell.index = indexPath.row
        let light = lights[indexPath.row]
        cell.roomLabel.text = light.division
        cell.lightSwitch.isOn = light.isOn
        cell.delegate = self
        
        return cell
    }
}

extension ViewController: LightTableViewCellDelegate {
    func lightDidSwitch(isOn: Bool, forIndex: Int) {
        lights[forIndex].isOn = isOn
    }
}

