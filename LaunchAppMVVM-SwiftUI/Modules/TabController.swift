//
//  TabController.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 20.12.2021.
//

import SwiftUI

class TabController: ObservableObject {
    @Published var activeTab = MainTabBar.launches

    func open(_ tab: MainTabBar) {
        activeTab = tab
    }
}
