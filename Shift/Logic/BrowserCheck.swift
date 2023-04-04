//
//  BrowserCheck.swift
//  Shift
//
//  Created by Alin Lupascu on 3/30/23.
//

import Foundation

// Get installed browsers and their state file information

func getAvailableBrowsers() async -> [BrowserPackage] {
    var browsers = [BrowserPackage]()
    
    for app in Brands.allCases {
        if FileManager.default.fileExists(atPath: app.url.path) {
            do {
                let data = try Data(contentsOf: app.url)
                let last_used = getActiveProfile(data: data)
                let profile_count = getProfileCount(data: data)
                let profile_names = getProfileNames(data: data)
//                let profile_info_email = getProfileName(data: data)
                if profile_count >= 2 { // Only show installed browsers with more than 1 profile to allow swapping between them
                    browsers.append(BrowserPackage(name:"\(app.self)".replacingOccurrences(of: "_", with: " "), stateFile: app.url, profileCount: profile_count, lastUsedProfile: last_used, profilesNames: profile_names))
                }
            }
            catch let error as NSError {
                print("Failed to add browser to the Browser Package: \(error)")
            }
            
        } else {
            print("File doesn't exist for app: \(app.self)".replacingOccurrences(of: "_", with: " "))
        }
    }

    return browsers
}

//    do {

//        let items = try fm.contentsOfDirectory(at: Path, includingPropertiesForKeys: nil, options: [])
//        for item in items {
//            do {
//
//                let brand = "\(item)"
//                if brand.contains(brands.google_chrome) {
//                    let fullPath = item.appendingPathComponent("Chrome").appendingPathComponent("Local State")
//                    browsers.append(BrowserPackage(name:"Google Chrome", stateFile: fullPath))
//
//
//                    // Writing to file
////                    do {
////                        try text.write(to: fileURL, atomically: false, encoding: .utf8)
////                    }
////                    catch {/* error handling here */}
//
//
//                    do {
//                        let data = try Data(contentsOf: fullPath)
//                        getLastUsed(data: data)
//                        getProfileCount(data: data)
//                        getProfileInfo(data: data)
//                        getLastUsed2(data: data)
//
//                    }
//                    catch let error as NSError {
//                        print("Failed to read Local State file for Google Chrome: \(error)")
//                    }
//
//
//
//
//                } else if brand.contains(brands.microsoft_edge) {
//                    let fullPath = item.appendingPathComponent("Local State")
//                    browsers.append(BrowserPackage(name:"Microsoft Edge", stateFile: fullPath))
//                } else if brand.contains(brands.brave) {
//                    let fullPath = item.appendingPathComponent("Brave-Browser").appendingPathComponent("Local State")
//                    browsers.append(BrowserPackage(name:"Brave Browser", stateFile: fullPath))
//                }
//            }
//        }

//        print(brands.test.absoluteString)
//        if fm.fileExists(atPath: brands.test.path) {
//            print("Test Exists!")
//        }


//    } catch let error as NSError {
//        print("Failed to get installed browsers: \(error)")
//    }
