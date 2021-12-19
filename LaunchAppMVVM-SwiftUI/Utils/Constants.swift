//
//  Constants.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 10.12.2021.
//

import Foundation
import SwiftUI

struct Display {
    static var width = UIScreen.main.bounds.width
    static var height = UIScreen.main.bounds.width
}

struct Constants {
    static let baseUrlString = "https://api.spacexdata.com/v3"
    static let baseURL: URL = {
        URL(string: baseUrlString)!
    }()
    
    static let delay: UInt32 = 1
}
