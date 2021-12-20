//
//  CapsuleCellViewModel.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 20.12.2021.
//

import SwiftUI

struct CapsuleCellViewModel: Equatable {
    let id: UUID = UUID()
    var statusButtonColor: Color
    var capsuleName: String
    var capsuleEmoji: String
}
