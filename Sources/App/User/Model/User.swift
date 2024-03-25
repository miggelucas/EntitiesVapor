//
//  User.swift
//
//
//  Created by Lucas Migge on 22/03/24.
//

import Foundation
import Vapor

struct User: Content {
    var id: String
    var name: String?
    var email: String?
    
}

