import SwiftUI

@main
struct Shift: App {
    
    var body: some Scene {
        WindowGroup {
            MenuBarPopup()
        }
        MenuBarExtra("", systemImage: "shift") {
            MenuBarPopup()
        }
        .menuBarExtraStyle(.window)

        Settings {
            SettingsWindow()
        }
    }
        
}
