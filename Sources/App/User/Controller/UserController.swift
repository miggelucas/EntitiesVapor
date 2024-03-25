//
//  UserController.swift
//
//
//  Created by Lucas Migge on 22/03/24.
//

import Foundation
import Vapor


struct UserController: RouteCollection {
    
    let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let userRoute = routes.grouped("users")
        userRoute.get(use: getAllUser)
        userRoute.get(":id", use: getUser)
        userRoute.post("register", use: registerUser)
        userRoute.delete(":id", use: deleteUser)
    }
                      
    func getAllUser(req: Request) async throws -> [User] {
        
        let users = userService.getAllUser()
        
        return users
    }
    
    func getUser(req: Request) async throws -> User {
        
        guard let id = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let user = userService.getUser(id: id) else {
            throw Abort(.expectationFailed)
        }

        return user
        
    }
    
    func registerUser(req: Request) async throws -> HTTPStatus {
    
        let user = try req.content.decode(User.self)
        
        userService.add(user: user)
        
        return .created
    }
    
    func deleteUser(req: Request) async throws -> HTTPStatus {
        
        guard let id = req.parameters.get("id", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        userService.deleteUser(id: id)
        
        return .ok
    }

    
}
