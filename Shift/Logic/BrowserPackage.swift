//
//  BrowserPackage.swift
//  Shift
//
//  Created by Alin Lupascu on 3/30/23.
//

import Foundation

struct BrowserPackage: Identifiable, Equatable, Hashable
{
    let id = UUID()
    let name: String
    let stateFile: URL
    let profileCount: Int
    let lastUsedProfile: String
    let profilesNames: [String]
    
    /// Currently for profilesEmails, if you pull this from the main browser folder, it will only get the active profile email.
    /// Will need to add logic to dig deeper into the Chrome Beta, Canary, Dev and Edge Beta, Canary, Dev folders as well if a user is using one of those versions of the browsers
//    let profilesEmails: [String]

}
