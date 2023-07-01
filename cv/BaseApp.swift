import SwiftUI

@main
struct BaseApp {
    
    static func main() throws {
        if NSClassFromString("XCTestCase") == nil {
            LaunchApp.main()
        } else {
            // if tests test are running don't launch app
            TestApp.main()
        }
    }
    
}

struct LaunchApp: App {
    
    var body: some Scene {
        WindowGroup {
            CharacterListConfigurator.createModule()
        }
    }
    
}

struct TestApp: App {

    var body: some Scene {
        WindowGroup { Text("Running Unit Tests") }
    }
    
}
