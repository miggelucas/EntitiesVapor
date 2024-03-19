//
//  EntitiesController.swift
//
//
//  Created by Lucas Migge on 18/03/24.
//

import Vapor

protocol EntityService {
    func getAllEntities() async throws -> [Entity]
    func getEntity(req: Request) async throws -> Entity
    
}


struct DatabaseEntityService: EntityService {
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

struct EntitiesController: RouteCollection {
    
    let entityService: EntityService
    
    init(entityService: EntityService) {
        self.entityService = entityService
    }
    
    func boot(routes: RoutesBuilder) throws {
        let entitiesRoute = routes.grouped("gods")
        entitiesRoute.get(use: getAllEntities)
        entitiesRoute.get(":id", use: getEntity)
        
    }
    
    func getAllEntities(req: Request) async throws -> [Entity] {
        return try await entityService.getAllEntities()
    }
    
    func getEntity(req: Request) async throws -> Entity {
        guard req.parameters.get("id", as: String.self) != nil else {
            throw Abort(.badRequest)
        }
        
        return try await entityService.getEntity(req: req)
    }
}
