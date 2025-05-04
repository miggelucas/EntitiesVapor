//
//  EntityServiceContext.swift
//  Gods
//
//  Created by Lucas Barros on 04/05/25.
//

import FluentKit


protocol HasDatabase {
    var database: any Database { get }
}

struct EntityServiceContext: HasDatabase {
    var database: any Database
}
