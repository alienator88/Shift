//
//  JSONParser.swift
//  Shift
//
//  Created by Alin Lupascu on 3/30/23.
//

import Foundation
import SwiftyJSON

// Get last profile used
func getActiveProfile(data: Data) -> String {
    if let json = try? JSON(data: data) {
        let last = json["profile"]["last_used"].string ?? "N/A"
//        print("Active: \(last)")
        return last
    }
    return "N/A"
}

// Get profile count
func getProfileCount(data: Data) -> Int {
    if let json = try? JSON(data: data) {
        let count = json["profile"]["profiles_created"].int ?? 0
//        print("Profile count: \(count)")
        return count
    }
    return 0
}

// Get profile name
func getProfileName(data: Data) -> [String] {
    if let json = try? JSON(data: data) {
        var dict = [String]()
        for (_, profiles) in json["profile"]["info_cache"] {
            let profile = profiles["name"].string ?? "N/A"
//            print("Profile Info: \(profile)")
            dict.append(profile)
        }
        return dict
    }
    return ["N/A"]
}

// Get profile names from the keys
func getProfileNames(data: Data) -> [String] {
    var dict = [String]()
    if let json = try? JSON(data: data) {
        let last = json["profile"]["info_cache"].dictionary ?? [:]
        for (key) in last {
//            print("Key: \(key.key)")
            dict.append(key.key)
        }
        return dict
//        print("Info: \(last.keys)")
    }
    return ["N/A"]
}



// These are for looping through arrays

//// Get Profile Count
//func getProfileCount(data: Data) {
//    if let json = try? JSON(data: data) {
//        for (_, profiles) in json["profile"] {
//            let profile = profiles["last_used"].string ?? "N/A"
//            print("Profile Count: \(profile)")
//        }
//    }
//}
//
//// Get type of the Pokemon
//func getType(data: Data) {
//    if let json = try? JSON(data: data) {
//        for (_, types) in json["profile"] {
//            let type = types["picker_shown"].bool ?? false
//            print("Type: \(type)")
//        }
//    }
//}
