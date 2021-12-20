//
//  MainTabBarView.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 18.12.2021.
//

import SwiftUI

struct MainTabBarView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var router: Router
    @StateObject var launchesVM = LaunchesViewModel()
    @StateObject var capsulesVM = CapsulesViewModel()
    
    @State private var presentSettings = false

    // MARK: - Construction
    
    var body: some View {
        TabView(selection: $router.tabController.activeTab) {
            LaunchesView(model: launchesVM)
                .tabItem {
                    configureTabItem(currentTab: .launches)
                }
                .tag(MainTabBar.launches)
            
            CapsulesView(model: capsulesVM)
                .tabItem {
                    configureTabItem(currentTab: .capsules)
                }
                .tag(MainTabBar.capsules)
        }
        .accentColor(Color.primaryTextColor)
        .sheet(isPresented: $presentSettings) {
            switch router.route {
            case .settings(type: let type):
                let model = SettingsViewModel(type: type)

                SettingsView(model: model)
            default: EmptyView()
            }
        }
        .onChange(of: router.route) { _ in
            isPresentedSettings()
        }
    }
    
    func isPresentedSettings() {
        switch router.route {
        case .settings(type: _):
            presentSettings = true
        case .mainTabBar:
            presentSettings = false
        }
    }
}

// MARK: - Helper Functions

extension MainTabBarView {
    private func configureTabItem(currentTab: MainTabBar) -> some View {
        switch currentTab {
        case .launches:
            if router.tabController.activeTab == currentTab {
                return Label("Launches", systemImage: "capslock")
            } else {
                return Label("Launches", systemImage: "capslock.fill")
            }
        case .capsules:
            if router.tabController.activeTab == currentTab {
                return Label("Capsules", systemImage: "bolt.car")
            } else {
                return Label("Capsules", systemImage: "bolt.car.fill")
            }
        }
    }
}

// MARK: - MainTabBarView_Previews

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
