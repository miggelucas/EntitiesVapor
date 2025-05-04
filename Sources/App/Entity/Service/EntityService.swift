//
//  EntityService.swift
//  Gods
//
//  Created by Lucas Barros on 02/05/25.
//

import Vapor


protocol EntityServicing: Sendable {
    typealias DependencyContext = EntityServiceContext
    func create(entity: EntityDTO, context: DependencyContext) async throws -> EntityDTO
    func getAll(context: DependencyContext) async throws -> [EntityDTO]
    func getById(_ id: String, context: DependencyContext) async throws -> EntityDTO
    func update(updatedEntity: EntityDTO, context: DependencyContext) async throws -> EntityDTO
    func delete(_ id: String, context: DependencyContext) async throws
}


struct EntityService: EntityServicing {
    func create(entity: EntityDTO, context: DependencyContext) async throws -> EntityDTO {
        let model = Entity(id: nil, name: entity.name, pantheon: entity.pantheon, description: entity.description)
        if let id = entity.id {
            model.id = UUID(uuidString: id)
        }
        try await model.save(on: context.database)
        return model.toDTO()
    }
    
    func getAll(context: DependencyContext) async throws -> [EntityDTO] {
        try await Entity.query(on: context.database).all().map { $0.toDTO() }
    }
    
    func getById(_ id: String, context: DependencyContext) async throws -> EntityDTO {
        let uuid = UUID(uuidString: id)
        guard let entity = try await Entity.find(uuid, on: context.database) else {
            throw Abort(.notFound)
        }
        return entity.toDTO()
    }
    
    func update(updatedEntity: EntityDTO, context: DependencyContext) async throws -> EntityDTO {
        guard let id = updatedEntity.id, let uuid = UUID(uuidString: id) else {
            throw Abort(.badRequest)
        }
        guard let entity = try await Entity.find(uuid, on: context.database) else {
            throw Abort(.notFound)
        }
        
        entity.name = updatedEntity.name
        entity.description = updatedEntity.description
        entity.pantheon = updatedEntity.pantheon
        try await entity.update(on: context.database)
        return entity.toDTO()
    }
    
    func delete(_ id: String, context: DependencyContext) async throws {
        let uuid = UUID(uuidString: id)
        guard let entity = try await Entity.find(uuid, on: context.database) else {
            throw Abort(.notFound)
        }
        
        try await entity.delete(on: context.database)
    }
}

