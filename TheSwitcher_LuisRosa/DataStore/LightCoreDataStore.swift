//
//  LightCoreDataStore.swift
//  TheSwitcher_LuisRosa
//
//  Created by Luis Carlos Rosa on 03/06/18.
//  Copyright © 2018 Luis. All rights reserved.
//

import UIKit
import CoreData

class LightCoreDataStore: LightStoreProtocol {
    let managedContext: NSManagedObjectContext
    let lightEntity: NSEntityDescription
    
    init() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate 
        self.managedContext = (appDelegate?.persistentContainer.viewContext)!
        self.lightEntity = NSEntityDescription.entity(forEntityName: "Light", in: managedContext)!
    }
    
    func getLights() -> [Light] {
        let lightFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Light")
        let lightResults = try! managedContext.fetch(lightFetch)
        if lightResults.count == 0 {
            insertInitialIntoStore()
            return getLights()
        }
        var lights = [Light]()
        for lightResult in lightResults as! [NSManagedObject] {
            let light = Light(divisionName: lightResult.value(forKey: "division") as! String, isOn: lightResult.value(forKey: "isOn") as! Bool)
            lights.append(light)
        }
        return lights
    }
    
    func updateLight(light: Light) {
        let lightFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Light")
        lightFetch.predicate = NSPredicate(format: "division = %@", light.division)
        let lights = try! managedContext.fetch(lightFetch)
        
        let managedLight = lights.first as! NSManagedObject
        managedLight.setValue(light.isOn, forKey: "isOn")
        
        save()
    }
    
    func insertInitialIntoStore() {
        let lights = [Light(divisionName: "Kitchen"), Light(divisionName: "Living room"), Light(divisionName: "Master bedroom"), Light(divisionName: "Guest’s bedroom")]
        
        for light in lights {
            let lightCD = NSManagedObject(entity: lightEntity, insertInto: managedContext)
            lightCD.setValue(light.division, forKey: "division")
            lightCD.setValue(light.isOn, forKey: "isOn")
            
            save()
        }
    }
    
    func save() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
