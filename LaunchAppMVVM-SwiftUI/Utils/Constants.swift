//
//  Constants.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 10.12.2021.
//

import Foundation

struct Constants {
    static let baseUrlString = "https://api.spacexdata.com/v3"
    static let baseURL: URL = {
        URL(string: baseUrlString)!
    }()
    
    static let delay: UInt32 = 1
}
