//
//  JSONParser.swift
//  Shift
//
//  Created by Alin Lupascu on 3/30/23.
//

import Foundation
import SwiftyJSON

// Get last profile used
func getLastUsed(data: Data) {
    if let json = try? JSON(data: data) {
        let last = json["profile"]["last_used"].string ?? "N/A"
        print("Last used: \(last)")
    }
}

// Get profile count
func getProfileCount(data: Data) {
    if let json = try? JSON(data: data) {
        let count = json["profile"]["profiles_created"].int ?? 0
        print("Profile count: \(count)")
    }
}

// Get Profile Info
func getProfileInfo(data: Data) {
    if let json = try? JSON(data: data) {
        for (_, profiles) in json["profile"]["info_cache"] {
            let profile = profiles["user_name"].string ?? "N/A"
            print("Profile Info: \(profile)")
        }
    }
}

// Get last profile used
func getLastUsed2(data: Data) {
    if let json = try? JSON(data: data) {
        let last = json["profile"]["info_cache"].dictionary ?? [:]
        for (key) in last {
            print("Key: \(key.key)")
        }
//        print("Info: \(last.keys)")
    }
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
