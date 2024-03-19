//
//  Entity.swift
//
//
//  Created by Lucas Migge on 18/03/24.
//

import Foundation
import Vapor


struct Entity: Content {
    let id: String
    let deck: String
    let name: String
    let description: [String]
    let tags: [String]
    
}

extension Entity {
    
    static func getAllEntities() -> [Entity] {
        return [.zeus, .poseidon]
    }
    
    static var zeus: Entity {
        Entity(id: "01",
               deck: "Greek",
               name: "Zeus",
               description: ["God king of gods", "Can throw lightning bolts from his hands"],
               tags: ["King", "Thunder", "Eagle"])
    }
    
    static var poseidon: Entity {
        Entity(id: "02",
               deck: "Greek",
               name: "Poseidon",
               description: ["God king of the sea", "Can control the sea level"],
               tags: ["Sea", "Horses", "Trident"])
    }
}
