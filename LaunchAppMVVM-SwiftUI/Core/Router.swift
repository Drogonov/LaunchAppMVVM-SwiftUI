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
