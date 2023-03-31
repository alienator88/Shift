//
//  BrowserPackage.swift
//  Shift
//
//  Created by Alin Lupascu on 3/30/23.
//

import Foundation

struct BrowserPackage: Identifiable, Equatable
{
    let id = UUID()
    let name: String
    let stateFile: URL
}
