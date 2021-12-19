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
    
    // MARK: - Construction
    
    var body: some View {
        TabView(selection: $router.route) {
            LaunchesView(model: launchesVM)
                .tabItem {
                    configureTabItem(currentRoute: .launches)
                }
                .tag(RoutesTypes.launches)
            
            CapsulesView(model: capsulesVM)
                .tabItem {
                    configureTabItem(currentRoute: .capsules)
                }
                .tag(RoutesTypes.capsules)
        }
        .accentColor(Color.primaryTextColor)
        .sheet(isPresented: $router.isPresentedSettings) {
//            let model = SettingsViewModel(type: router.route)
//            SettingsView(
//                model: <#T##SettingsViewModel#>,
//                confirmButtonAction: {}
//            )
        }
    }
}

// MARK: - Helper Functions

extension MainTabBarView {
    private func configureTabItem(currentRoute: RoutesTypes) -> some View {
        switch currentRoute {
        case .launches:
            if router.route == currentRoute {
                return Label("Launches", systemImage: "capslock")
            } else {
                return Label("Launches", systemImage: "capslock.fill")
            }
        default:
            if router.route == currentRoute {
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
