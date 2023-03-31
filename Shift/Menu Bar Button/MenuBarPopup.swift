import SwiftUI

struct MenuBarPopup: View {
    
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                
                Button {
                    AboutWindow.show()
                } label: {
                    Image(systemName: "info.circle.fill")
                }
                .buttonStyle(PlainButtonStyle())
                .help("About")
                
                Button {
                    SettingsWindow.show()
                } label: {
                    Image(systemName: "gear")
                }
                .buttonStyle(PlainButtonStyle())
                .help("Settings")
                
                Spacer()
                
                Button {
                    NSApplication.shared.terminate(nil)
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
                .buttonStyle(PlainButtonStyle())
                .help("Quit")
                .keyboardShortcut("q")
                
                
            }
            .padding(5)
            
            HStack{
                Image(systemName: "shift")
                Text("Shift")
            }
            
            
            Divider()
            
            Spacer()
            
            
            
            
            Spacer()
            //            Button {
            //                AboutWindow.show()
            //            } label: {
            //                Text("About...")
            //            }
            
//            Button("Settings") {
//                SettingsWindow.show()
//            }
//            Button("About") {
//                AboutWindow.show()
//            }
//            Button("Quit") {
//                NSApplication.shared.terminate(nil)
//            }.keyboardShortcut("q")
        }
        .frame(width: 200, height: 200)
        .background(ignoresSafeAreaEdges: .all)
        .onAppear{
            Task {
                async let getBrowsers = await getAvailableBrowsers()
//                await print(getBrowsers)
            }
        }
    }
}



