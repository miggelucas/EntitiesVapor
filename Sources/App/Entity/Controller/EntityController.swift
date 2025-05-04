//
//  EntityController.swift
//  Gods
//
//  Created by Lucas Barros on 02/05/25.
//

import Vapor


struct EntityController: RouteCollection {
    private typealias DependencyContext = EntityServiceContext
    
    let service: any EntityServicing
    
    init(service: any EntityServicing = EntityService()) {
        self.service = service
    }
    
    func boot(routes: any RoutesBuilder) throws {
        let entities = routes.grouped("entities")
        
        entities.post(use: self.create)
        entities.put(":id", use: self.update)
        entities.get(":id", use: self.getById)
        entities.get(use: self.getAll)
        entities.delete(":id", use: self.delete)
    }
    
    @Sendable
    func create(req: Request) async throws -> EntityDTO {
        let entity = try req.content.decode(EntityDTO.self)
        let context = DependencyContext(database: req.db)
        return try await service.create(entity: entity, context: context)
    }
    
    @Sendable
    func getById(req: Request) async throws -> EntityDTO {
        let id = try req.parameters.require("id")
        let context = DependencyContext(database: req.db)
        return try await service.getById(id, context: context)
    }
    
    @Sendable
    func getAll(req: Request) async throws -> [EntityDTO] {
        let context = DependencyContext(database: req.db)
        return try await service.getAll(context: context)
    }
    
    @Sendable
    func update(req: Request) async throws -> EntityDTO {
        let entityContent = try req.content.decode(EntityDTO.self)
        let context = DependencyContext(database: req.db)
        return try await service.update(updatedEntity: entityContent, context: context)
    }
    
    @Sendable
    func delete(req: Request) async throws -> HTTPStatus {
        let id = try req.parameters.require("id")
        let context = DependencyContext(database: req.db)
        try await service.delete(id, context: context)
        return .noContent
    }
}


