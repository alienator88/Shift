//
//  BrowserDataStorage.swift
//  Shift
//
//  Created by Alin Lupascu on 4/3/23.
//

import Foundation

@MainActor
class BrowserDataStorage: ObservableObject
{
    @Published var installedBrowsers = [BrowserPackage]()
}
