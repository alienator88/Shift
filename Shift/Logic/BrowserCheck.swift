//
//  BrowserCheck.swift
//  Shift
//
//  Created by Alin Lupascu on 3/30/23.
//

import Foundation

//struct Profile: Decodable {
//    var
//}

func getAvailableBrowsers() async -> [BrowserPackage] {
    let documentURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
    let Path = documentURL.appendingPathComponent("Application Support").absoluteURL
    
    var browsers = [BrowserPackage]()
    let brands = Brands()
    
    do {
        
        let items = try FileManager.default.contentsOfDirectory(at: Path, includingPropertiesForKeys: nil, options: [])
        for item in items {
            do {
                
                let brand = "\(item)"
                if brand.contains(brands.google_chrome) {
                    let fullPath = item.appendingPathComponent("Chrome").appendingPathComponent("Local State")
                    browsers.append(BrowserPackage(name:"Google Chrome", stateFile: fullPath))
                    
                                        
                    //                            //writing
                    //                            do {
                    //                                try text.write(to: fileURL, atomically: false, encoding: .utf8)
                    //                            }
                    //                            catch {/* error handling here */}
                    
                    //reading
                    do {
//                        let text = try String(contentsOf: fullPath, encoding: .utf8)
//                        let data = Data(text.utf8)
                        let data = try Data(contentsOf: fullPath)
                        getLastUsed(data: data)
                        getProfileCount(data: data)
                        getProfileInfo(data: data)
                        getLastUsed2(data: data)

//                        let data = Data(text.utf8)
//                        do {
//                            // make sure this JSON is in the format we expect
//                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
////                                print(json["profile"])
//                                // try to read out a string array
//                                if let profiles = json["profile"] as? [NSDictionary] {
//                                    print(profiles)
//                                }
//                            }
//                        } catch let error as NSError {
//                            print("Failed to load: \(error.localizedDescription)")
//                        }
                        
                    }
                    catch let error as NSError {
                        print("Failed to read Local State file for Google Chrome: \(error)")
                    }
                    
                    
                    
                    
                } else if brand.contains(brands.microsoft_edge) {
                    let fullPath = item.appendingPathComponent("Local State")
                    browsers.append(BrowserPackage(name:"Microsoft Edge", stateFile: fullPath))
                } else if brand.contains(brands.brave) {
                    let fullPath = item.appendingPathComponent("Brave-Browser").appendingPathComponent("Local State")
                    browsers.append(BrowserPackage(name:"Brave Browser", stateFile: fullPath))
                }
                
                
            }
        }
        
        
    } catch let error as NSError {
        print("Failed to get installed browsers: \(error)")
    }
    
    return browsers
}

