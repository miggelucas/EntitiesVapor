//
//  InMemoryUserDatabase.swift
//
//
//  Created by Lucas Migge on 25/03/24.
//

import Foundation

class InMemoryUserDatabase: UserService {
    
    let userSample: User = .init(id: "test", name: "Thom Yorke")
    
    func add(user: User) {
        
    }
    
    func getAllUser() -> [User] {
        return []
    }
    
    func getUser(id: String) -> User? {
        
        if id == User.sample.id {
            return User.sample
        }


        return nil
    }
    
    func deleteUser(id: String) {
       
    }
    
    
}
