import Vapor

func routes(_ app: Application) throws {
    
    let databaseEntityService = DatabaseEntityService()
       let entitiesController = EntitiesController(entityService: databaseEntityService)
       try app.register(collection: entitiesController)
    
    
    app.get { req async in
        "It works!"
    }
    
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
  
}
