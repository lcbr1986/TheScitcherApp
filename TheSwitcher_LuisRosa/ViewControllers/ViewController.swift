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
    let lightStore: LightStoreProtocol = LightCoreDataStore()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Switcher App"
        
        self.lights = lightStore.getLights()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            backItem.tintColor = .white
            navigationItem.backBarButtonItem = backItem
            
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            let light = lights[indexPath.row]
            let detailViewController = segue.destination as! LightDetailViewController
            detailViewController.light = light
        }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: LightTableViewCellDelegate {
    func lightDidSwitch(isOn: Bool, forIndex: Int) {
        var updatedLight = lights[forIndex]
        updatedLight.isOn = isOn
        lightStore.updateLight(light: updatedLight)
    }
}

