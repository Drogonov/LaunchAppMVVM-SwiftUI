//
//  CapsuleDetailsViewModel.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 13.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct CapsuleDetailsViewModel {
    var navigationTitle: String = ""
    var capsuleValues: [CapsuleDetailsCellViewModel] = []
}

struct CapsuleDetailsCellViewModel {
    var title: String = ""
    var value: String = ""
}
