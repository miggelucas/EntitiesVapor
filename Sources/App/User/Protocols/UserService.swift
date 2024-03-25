//
//  UserService.swift
//  
//
//  Created by Lucas Migge on 25/03/24.
//

import Foundation

protocol UserService {
    func add(user: User)
    func getAllUser() -> [User]
    func getUser(id: String) -> User?
    func deleteUser(id: String)
    
}
