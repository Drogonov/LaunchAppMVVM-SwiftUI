//
//  Router.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var route: RoutesTypes = .mainTabBar
    @Published var tabController = TabController()
}

enum RoutesTypes: Hashable {
    case settings(type: MainTabBar)
    case mainTabBar
}

enum MainTabBar {
    case launches
    case capsules
}

class TabController: ObservableObject {
    @Published var activeTab = MainTabBar.launches

    func open(_ tab: MainTabBar) {
        activeTab = tab
    }
}


