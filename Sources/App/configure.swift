import Vapor
import Fluent
import FluentMySQLDriver

public func configure(_ app: Application) async throws {
    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none
    
    let hostname = Environment.get("MYSQL_HOST") ?? "127.0.0.1"
    let username = Environment.get("MYSQL_USER") ?? "root"
    let password = Environment.get("MYSQL_PASSWORD") ?? ""
    let database = Environment.get("MYSQL_DATABASE") ?? "gods_database"
    
    app.databases.use(
        .mysql(
            hostname: hostname,
            username: username,
            password: password,
            database: database,
            tlsConfiguration: tls
        ),
        as: .mysql
    )
    
    app.migrations.add(CreateEntity())
    try await app.autoMigrate()
    
    try routes(app)
}
