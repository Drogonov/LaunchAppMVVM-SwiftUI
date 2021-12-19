//
//  LaunchesViewModel.swift
//  LaunchAppMVP+R+UIKit
//
//  Created by Anton Vlezko on 12.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

class LaunchesViewModel: ObservableObject {
    
    // MARK: - Properties

    let navigationTitle: String = "Launches"
    @Published var loadState: LoadState = .initial
    @Published var launches: [LaunchesCellViewModel] = []
    
    @Inject var spaceXDataService: SpaceXDataService

    // MARK: - Construction
    
    init() {
        loadLaunches()
    }
}

// MARK: - Helper Functions

extension LaunchesViewModel {
    private func loadLaunches() {
        loadState = .loading
        spaceXDataService.getLaunchesList { [weak self] result in
            guard let self = self else { return }
            sleep(Constants.delay)
            switch result {
            case .success(let response):
                guard let launches = response else { return }
                self.configureLaunchesArray(with: launches)
                self.loadState = .success
            case .failure(let error):
                self.loadState = .fail
                debugPrint(error)
            }
        }
    }
    
    private func configureLaunchesArray(with response: [LaunchMo]) {
        launches = response.map { model in
            return LaunchesCellViewModel(
                name: model.missionName ?? "unnamed",
                details: model.details ?? "no data",
                launchYear: model.launchYear ?? "no data",
                imageURL: model.links?.missionPatchSmall ?? ""
            )
        }
    }
}
