//
//  Router.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//

import Foundation
import SwiftUI

enum RoutesTypes {
    case launches
    case launchesDetails
    case capsules
    case settings
    case mainTabBar
}

class Router: ObservableObject {
    @Published var route: RoutesTypes = .mainTabBar
}
