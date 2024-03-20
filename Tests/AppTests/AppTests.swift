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
    
    func testRegisterEntity() async throws {
           // Arrange
           let app = Application(.testing)
           defer { app.shutdown() }
           try await configure(app)
           
           let entity = Entity(id: "testId", deck: "testDeck", name: "testName", description: ["test"], tags: [
           "test"])
           let requestData = try JSONEncoder().encode(entity)
           
           try app.test(.POST, "gods/entity", headers: ["Content-Type": "application/json"], body: .init(data: requestData)) { res in
               XCTAssertEqual(res.status, .ok)
           }
       }
}
