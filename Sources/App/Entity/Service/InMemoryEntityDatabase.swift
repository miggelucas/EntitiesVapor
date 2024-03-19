//
//  InMemoryEntityDatabase.swift
//
//
//  Created by Lucas Migge on 19/03/24.
//

import Foundation
import Vapor


struct InMemoryEntityDatabase: EntityService {
    func getAllEntities() async throws -> [Entity] {
        return Entity.getAllEntities()
    }
    
    func getEntity(req: Request) async throws -> Entity {
        guard let id = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        let result = Entity.getAllEntities().first(where: {$0.id == id })!
        return result
    }
}
