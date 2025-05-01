//
//  CreateEntity.swift
//  Gods
//
//  Created by Lucas Barros on 27/04/25.
//

import Fluent


struct CreateEntity: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema(Entity.schema)
            .id() // Cria o campo ID automaticamente como UUID
            .field("name", .string, .required)
            .field("pantheon", .string, .required)
            .field("description", .string, .required)
            .create()
    }

    func revert(on database: any Database) async throws {
        try await database.schema("entities").delete()
    }
}
