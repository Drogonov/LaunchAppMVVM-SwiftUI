//
//  CapsulesViewModel.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

class CapsulesViewModel: ObservableObject {
    
    // MARK: - Properties

    let navigationTitle: String = "Capsules"
    @Published var loadState: LoadState = .initial
    @Published var capsules: [CapsuleCellViewModel] = []
    
    @Inject var spaceXDataService: SpaceXDataService
    
    // MARK: - Methods
    
    func loadCapsules() {
        loadState = .loading
        spaceXDataService.getCapsulesList { [weak self] result in
            guard let self = self else { return }
            sleep(Constants.delay)
            switch result {
            case .success(let response):
                guard let capsules = response else { return }
                self.configureCapsulesArray(with: capsules)
                self.loadState = .success
            case .failure(let error):
                self.loadState = .fail
                debugPrint(error)
            }
        }
    }
}

// MARK: - Helper Functions

extension CapsulesViewModel {
    private func configureCapsulesArray(with response: [CapsuleMo]) {
        let newCapsules = response.map { model -> CapsuleCellViewModel in
            let statusButtonColor: Color = model.status == "active" ? .green : .red
            let serial = model.capsuleSerial ?? "no serial"
            
            return CapsuleCellViewModel(
                statusButtonColor: statusButtonColor,
                capsuleName: serial,
                capsuleEmoji: "🛰"
            )
        }
        
        if newCapsules != capsules {
            capsules = newCapsules
        }
    }
}
