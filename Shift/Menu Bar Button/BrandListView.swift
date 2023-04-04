//
//  BrandListView.swift
//  Shift
//
//  Created by Alin Lupascu on 4/3/23.
//

import SwiftUI

struct BrowserListItem: View
{
    var packageItem: BrowserPackage
    @State private var isOn = false
    
    var body: some View
    {
            VStack(alignment: .leading)
            {
                HStack(alignment: .firstTextBaseline, spacing: 5)
                {
//                    Image(systemName: "safari")
                    Text(packageItem.name)
                        .help("\(packageItem.stateFile)".replacingOccurrences(of: "%20", with: " ").replacingOccurrences(of: "file://", with: ""))
                    Text(" (\(packageItem.profileCount) profiles)")
                        .font(.subheadline)
                }
                Text("Active Profile: \(packageItem.lastUsedProfile)")
                List{
                    ForEach(packageItem.profilesNames, id: \.self) { item in
//                        Toggle(isOn: name) {
                        Button(item) {
                            killBrowser(name: packageItem.name)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
                                swapProfiles(url: packageItem.stateFile, profile: item)

                            }
                            
                        }
//                        }
                    }
                }
            } // VStack
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(.white.opacity(1), lineWidth: 1)
            )
//            .disabled(true)

        
    }
}
