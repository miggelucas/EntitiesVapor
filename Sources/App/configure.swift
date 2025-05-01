import Vapor
import Fluent
import FluentMySQLDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    // register routes
    
    // configure mysql database
    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none
    
    app.databases.use(
        .mysql(
            hostname: "127.0.0.1",
            username: "root",
            password: "password",
            database: "EntitiesDB",
            tlsConfiguration: tls
        ),
        as: .mysql
    )
    
    // configure entity table scheme
    app.migrations.add(CreateEntity())
    try await app.autoMigrate()

    try routes(app)
}
