//
//  SettingsViewModel.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 17.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let type: TabBarItemType
    
    var navigationTitle: String {
        setNavigationTitle()
    }
    
    var text: String {
        setText()
    }
    
    let buttonText: String = "Confirm"
    
    // MARK: - Construction
    
    init(type: TabBarItemType) {
        self.type = type
    }
}

// MARK: - Helper Functions

extension SettingsViewModel {
    private func setNavigationTitle() -> String {
        switch type {
        case .launches:
            return "Launches Settings"
        case .capsules:
            return "Capsules Settings"
        }
    }
    
    private func setText() -> String {
        switch type {
        case .launches:
            return "Falcon 9 is a reusable, two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of people and payloads into Earth orbit and beyond. Falcon 9 is the world’s first orbital class reusable rocket. Reusability allows SpaceX to refly the most expensive parts of the rocket, which in turn drives down the cost of space access."
        case .capsules:
            return "The Dragon spacecraft is capable of carrying up to 7 passengers to and from Earth orbit, and beyond. It is the only spacecraft currently flying that is capable of returning significant amounts of cargo to Earth, and is the first private spacecraft to take humans to the space station."
        }
    }
}
