import Vapor

func routes(_ app: Application) throws {
    
    app.get { req async in
        "It works!"
    }
    
    app.get("hello") { req in
        "Hello, world!"
    }
    
    app.get("hello", ":name") { req in
        let name = req.parameters.get("name") ?? "anonymous"
        return "Hello, \(name)!"
    }
    
    try app.register(collection: EntityController())
}
