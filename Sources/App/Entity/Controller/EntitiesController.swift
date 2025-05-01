//
//  EntitiesController.swift
//
//
//  Created by Lucas Migge on 18/03/24.
//

import Vapor


//struct EntitiesController: RouteCollection {
//    
//    let entityService: EntityServiceProtocol?
//    
//    init(entityService: EntityServiceProtocol? = nil) {
//        self.entityService = entityService
//    }
//    
//    func boot(routes: RoutesBuilder) throws {
//        let entitiesRoute = routes.grouped("gods")
//        entitiesRoute.get(use: getAllEntities)
//        entitiesRoute.get(":id", use: getEntity)
//        entitiesRoute.post("entity", use: registerEntity)
//        
//    }
//    
//    func getAllEntities(req: Request) async throws -> [En] {
//        return try await entityService.getAllEntities()
//    }
//    
//    func getEntity(req: Request) async throws -> Entity {
//        guard let id = req.parameters.get("id", as: String.self) else {
//            throw Abort(.badRequest)
//        }
//        
//        return try await entityService.getEntity(id: id)
//    }
//    
//    func registerEntity(req: Request) async throws -> HTTPStatus {
//        let entity = try req.content.decode(Entity.self)
//        
//        entityService.registerEntity(entity)
//        
//        return .ok
//    }
//}
