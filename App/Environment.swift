//
//  Environment.swift
//  App
//
//  Created by Mael Romanin Bluteau on 02/05/2022.
//

import Foundation

enum Environment: String {
    case debug = "Debug"
    case release = "Release"
    case demo = "Demo"
}

class BuildConfiguration {
    static let shared = BuildConfiguration()
    
    var environment: Environment
    
    init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String
        environment = Environment(rawValue: currentConfiguration)!
    }
}
