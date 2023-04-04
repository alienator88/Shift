import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var browserData: BrowserDataStorage
    
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
            
            
            List{
                ForEach(browserData.installedBrowsers, id: \.self) { browser in
                    BrowserListItem(packageItem: browser)
                }
            }
            
            //            List{
            //                ForEach()
            //                { browser in
            //                    NavigationLink
            //                    {
            //
            //                    } label: {
            //                        BrowserListItem(packageItem: browser)
            //                    }
            //                    .contextMenu
            //                    {
            //                        Button
            //                        {
            //                            Task
            //                            {
            ////                                try await uninstallSelectedPackage(package: formula, brewData: brewData, appState: appState)
            //                            }
            //                        } label: {
            //                            Text("Uninstall \(browser.name)")
            //                        }
            //                    }
            //                }
            //            }
            
            Spacer()
            
            
            
            
            
        }
        .frame(minWidth: 100, minHeight: 300)
        .onAppear{
            Task {
                browserData.installedBrowsers = await getAvailableBrowsers()
                //                async let getBrowsers = await getAvailableBrowsers()
                //                await print(getBrowsers)
            }
        }
        
    }
}



