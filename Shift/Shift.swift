import SwiftUI

@main
struct Shift: App {
    
    @StateObject var browserData = BrowserDataStorage()
    
    var body: some Scene {

        MenuBarExtra("", systemImage: "shift") {
            ContentView()
                .environmentObject(browserData)

        }
        .menuBarExtraStyle(.window)
        .windowResizability(.contentSize)

        Settings {
            SettingsWindow()
        }
    }
        
}
