//
//  Light.swift
//  TheSwitcher_LuisRosa
//
//  Created by Luis Carlos Rosa on 03/06/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import Foundation

struct Light {
    var isOn: Bool
    let division: String
    
    init(divisionName: String, isOn:Bool = false) {
        self.division = divisionName
        self.isOn = isOn
    }
}
