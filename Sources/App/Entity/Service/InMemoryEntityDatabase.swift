//
//  InMemoryEntityDatabase.swift
//
//
//  Created by Lucas Migge on 19/03/24.
//

import Foundation
import Vapor


class InMemoryEntityDatabase: EntityService {

    var allEntities: Set<Entity> = Set(Entity.getAllEntities())
    
    func getAllEntities() async throws -> [Entity] {
        return Array(allEntities)
    }
    
    func getEntity(id: String) async throws -> Entity {
        
        guard let result = allEntities.first(where: {$0.id == id }) else {
            throw Abort(.badRequest)
        }
        return result
    }
    
    func registerEntity(_ entity: Entity) {
        allEntities.insert(entity)
        
    }
    
}
