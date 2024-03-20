//
//  EntitiesController.swift
//
//
//  Created by Lucas Migge on 18/03/24.
//

import Vapor


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
