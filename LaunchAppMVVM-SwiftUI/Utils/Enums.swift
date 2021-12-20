//
//  Enums.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 17.12.2021.
//

import SwiftUI
import UIKit

enum NotificationConfiguration {
    case textField
    case defaultAction
    case rejectAction
    
    init() {
        self = .defaultAction
    }
}

enum LoadState {
    case initial
    case loading
    case fail
    case success
}

enum RoutesTypes: Hashable {
    case settings(type: MainTabBar)
    case mainTabBar
}

enum MainTabBar {
    case launches
    case capsules
}
