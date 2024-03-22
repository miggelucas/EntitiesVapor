import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    
    let databaseEntityService = InMemoryEntityDatabase()
    let entitiesController = EntitiesController(entityService: databaseEntityService)
    try app.register(collection: entitiesController)
    
    try routes(app)
}
