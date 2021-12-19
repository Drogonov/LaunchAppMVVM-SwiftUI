//
//  MaunTabBarView.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 18.12.2021.
//

import SwiftUI

struct MainTabBarView: View {
    @EnvironmentObject var router: Router
    @StateObject var launchesVM = LaunchesViewModel()
    @StateObject var capsulesVM = CapsulesViewModel()
    
    var body: some View {
        TabView(selection: $router.route) {
            LaunchesView(model: launchesVM)
                .tag(RoutesTypes.launches)
                .tabItem {
                    Label("Launches", systemImage: "list.dash")
                }
            
            CapsulesView()
                .tag(RoutesTypes.capsules)
                .tabItem {
                    Label("Capsules", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
