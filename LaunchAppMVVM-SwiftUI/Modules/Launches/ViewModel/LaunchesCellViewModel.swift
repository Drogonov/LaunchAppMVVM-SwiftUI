//
//  LaunchesCellViewModel.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 19.12.2021.
//

import Foundation

struct LaunchesCellViewModel: Equatable {
    let id: UUID = UUID()
    var name: String = "unnamed"
    var details: String = "no data"
    var launchYear: String = "no year"
    var imageURL: String = ""
}
