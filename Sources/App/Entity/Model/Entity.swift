//
//  Entity.swift
//
//
//  Created by Lucas Migge on 18/03/24.
//

import Foundation
import Vapor


struct EntityRequest: Content, Hashable, Sendable {
    let id: String
    let deck: String
    let name: String
    let description: String
}

