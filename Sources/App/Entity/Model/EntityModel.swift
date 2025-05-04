//
//  EntityModel.swift
//  Gods
//
//  Created by Lucas Barros on 27/04/25.
//

import Fluent

final class Entity: Model, @unchecked Sendable {
    
    static let schema = "entities"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "pantheon")
    var pantheon: Pantheon
    
    @Field(key: "description")
    var description: String
    
    init() {}
    
    init(id: UUID?, name: String, pantheon: Pantheon, description: String) {
        self.id = id
        self.name = name
        self.pantheon = pantheon
        self.description = description
    }
}

extension Entity {
    func toDTO() -> EntityDTO {
        return .init(
            id: self.id?.uuidString,
            pantheon: self.pantheon,
            name: self.name,
            description: self.description
        )
    }
}





