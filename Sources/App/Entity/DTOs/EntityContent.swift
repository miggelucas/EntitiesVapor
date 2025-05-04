//
//  Entity.swift
//
//
//  Created by Lucas Migge on 18/03/24.
//

import Foundation
import Vapor


struct EntityDTO: Content, Hashable, Sendable {
    let id: String?
    let pantheon: Pantheon
    let name: String
    let description: String
}

extension EntityDTO {
    func toModel() -> Entity {
        let model = Entity()
        model.name = self.name
        model.pantheon = self.pantheon
        model.description = self.description
        if let idString = self.id {
            model.id = UUID(uuidString: idString)
        }
        return model
    }
}

