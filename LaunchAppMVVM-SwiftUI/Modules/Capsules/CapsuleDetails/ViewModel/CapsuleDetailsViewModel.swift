//
//  CapsuleDetailsViewModel.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 13.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class CapsuleDetailsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let model: CapsuleDetailsModel
    
    var navigationTitle: String {
        configureNavigationTitle()
    }
    
    @Published var loadState: LoadState = .initial
    @Published var capsuleValues: [CapsuleDetailsCellViewModel] = []
    
    @Inject var spaceXDataService: SpaceXDataService
    
    // MARK: - Construction
    
    init(model: CapsuleDetailsModel) {
        self.model = model
    }
    
    // MARK: - Methods
    
    func loadCapsule() {
        loadState = .loading
        spaceXDataService.getCapsule(serial: model.serial) { [weak self] result in
            guard let self = self else { return }
//            sleep(Constants.delay)
            switch result {
            case .success(let response):
                guard let capsules = response else { return }
                self.configureCapsule(with: capsules)
                self.loadState = .success
            case .failure(let error):
                self.loadState = .fail
                debugPrint(error)
            }
        }
    }
}

// MARK: - Helper Functions

extension CapsuleDetailsViewModel {
    private func configureNavigationTitle() -> String {
        return "Capsule " + model.serial
    }
    
    private func configureCapsule(with response: CapsuleMo) {
        self.capsuleValues = []
        
        capsuleValues.append(
            CapsuleDetailsCellViewModel(
                title: "Symbol",
                value: "🛰"
            )
        )
        
        capsuleValues.append(
            CapsuleDetailsCellViewModel(
                title: "Landings",
                value: response.landings?.numberToString ?? "No info"
            )
        )
        
        capsuleValues.append(
            CapsuleDetailsCellViewModel(
                title: "Details",
                value: response.details ?? "No info"
            )
        )
    }
}
