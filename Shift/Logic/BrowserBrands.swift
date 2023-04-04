//
//  BrowserBrands.swift
//  Shift
//
//  Created by Alin Lupascu on 3/30/23.
//

import Foundation

enum Brands: String, CaseIterable {
    private var filePath: String { return FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!.absoluteString }
    
    case Chrome_Stable = "Google/Chrome/Local State"
    case Chrome_Beta = "Google/Chrome Beta/Local State"
    case Chrome_Canary = "Google/Chrome Canary/Local State"
    case Chrome_Dev = "Google/Chrome Dev/Local State"
    case Edge_Stable = "Microsoft Edge/Local State"
    case Edge_Beta = "Microsoft Edge Beta/Local State"
    case Edge_Canary = "Microsoft Edge Canary/Local State"
    case Edge_Dev = "Microsoft Edge Dev/Local State"
    case Brave_Stable = "BraveSoftware/Brave-Browser/Local State"
    case Brave_Beta = "BraveSoftware/Brave-Browser-Beta/Local State"
    
    var url: URL {
        guard let url = URL(string: filePath) else {
            preconditionFailure("The url used in \(Brands.self) is not valid")
        }
        return url.appendingPathComponent(self.rawValue)
    }
}
