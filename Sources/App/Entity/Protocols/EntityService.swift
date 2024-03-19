//
//  File.swift
//  
//
//  Created by Lucas Migge on 19/03/24.
//

import Foundation
import Vapor

protocol EntityService {
    func getAllEntities() async throws -> [Entity]
    func getEntity(req: Request) async throws -> Entity
    
}

