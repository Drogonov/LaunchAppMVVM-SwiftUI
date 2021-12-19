//
//  Router.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//

import Foundation
import SwiftUI

enum RoutesTypes: Hashable {
    case launches
    case capsules
    case settings(type: TabBarItemType)
    case mainTabBar
}

class Router: ObservableObject {
    @Published var route: RoutesTypes = .mainTabBar
    @Published var isPresentedSettings: Bool = false
}
