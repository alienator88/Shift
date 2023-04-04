//
//  ProfileSwap.swift
//  Shift
//
//  Created by Alin Lupascu on 4/3/23.
//

import Foundation
import SwiftyJSON

func swapProfiles(url: URL, profile: String)  {
    do {
        let data = try Data(contentsOf: url)
        var json = try? JSON(data: data)
        json?["profile"]["last_used"].string = profile
        json?["profile"]["picker_shown"].bool = false
        json?["profile"]["show_picker_on_startup"].bool = false
        do {
            let jsonData = try json?.rawData()
            try jsonData?.write(to: url)
        } catch let error as NSError {
            print("Failed to write to local state file: \(error)")
        }
    } catch let error as NSError {
        print("Failed to swap profiles: \(error)")
    }
        
}

func killBrowser(name: String) {
    let pipe = Pipe()

    let task = Process()
    task.launchPath = "/usr/bin/killall"
    task.arguments = ["Google Chrome"]
    task.standardOutput = pipe
    task.standardError = pipe
    task.launch()
    task.waitUntilExit()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    if let output = String(data: data, encoding: .utf8) {
        print(output)
    }
}
