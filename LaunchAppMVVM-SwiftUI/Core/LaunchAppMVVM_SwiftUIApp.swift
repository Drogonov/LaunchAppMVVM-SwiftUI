//
//  LaunchAppMVVM_SwiftUIApp.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 18.12.2021.
//

import SwiftUI

@main
struct LaunchAppMVVM_SwiftUIApp: App {
    let router = Router()
    let spaceXDataService = SpaceXDataService()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .environmentObject(spaceXDataService)
        }
    }
}
