@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testHelloWorld() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        
        try app.test(.GET, "hello", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "Hello, world!")
        })
    }
    
    
    func testGodsHome() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        
        try app.test(.GET, "gods") { res in
            XCTAssertEqual(res.status, .ok)
            // Verifica se o Content-Type da resposta é JSON
            XCTAssertTrue(res.headers.contentType == .json)
            
            XCTAssertNoThrow(try res.content.decode([Entity].self))
            
            
        }
        
    }
}
