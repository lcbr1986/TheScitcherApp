//
//  LighStoreProtocol.swift
//  TheSwitcher_LuisRosa
//
//  Created by Luis Carlos Rosa on 03/06/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import Foundation

protocol LightStoreProtocol {
    func getLights() -> [Light]
    func updateLight(light: Light)
}
