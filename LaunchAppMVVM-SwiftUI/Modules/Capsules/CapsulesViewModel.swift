//
//  CapsulesViewModel.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

class CapsulesViewModel: ObservableObject {
    var navigationTitle: String = ""
    var capsules: [CapsuleCellViewModel] = []
}

struct CapsuleCellViewModel {
    let id: UUID = UUID()
    var statusButtonColor: Color
    var capsuleName: String
    var capsuleEmoji: String
}
