//
//  LaunchesView.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 18.12.2021.
//

import SwiftUI
import UIKit
import Kingfisher

struct LaunchesView: View {
    
    // MARK: - Properties
    
    @ObservedObject var model: LaunchesViewModel
    
    // MARK: - Construction
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.launches, id: \.id) { launch in
                    configureLaunchCell(with: launch)
                }
            }
            .listStyle(.plain)
            .navigationTitle(model.navigationTitle)
        }
    }
}

// MARK: - Helper Functions

extension LaunchesView {
    private func configureLaunchCell(with launch: LaunchesCellViewModel) -> some View {
        
        HStack(alignment: .top, spacing: 16) {
            if let url = URL(string: launch.imageURL) {
                configurePatchImage(with: url)
                    .resizable()
                    .frame(width: 120, height: 120)
            } else {
                Image(uiImage: UIImage(named: "logo")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
            }
                        
            VStack(alignment: .leading, spacing: 16) {
                Text(launch.name)
                    .font(Font.system(size: 20, weight: .bold, design: .default))
                Text(launch.launchYear)
                    .font(Font.system(size: 18))
                Text(launch.details)
            }
        }
    }
        
    private func configurePatchImage(with url: URL) -> KFImage {
        
        return KFImage(url)
            .placeholder {
                // Placeholder while downloading.
                Image(systemName: "arrow.2.circlepath.circle")
                    .font(.largeTitle)
                    .opacity(0.3)
            }
            .retry(maxCount: 3, interval: .seconds(5))
            .onSuccess { r in
                // r: RetrieveImageResult
                print("success: \(r)")
            }
            .onFailure { e in
                // e: KingfisherError
                print("failure: \(e)")
            }
            .resizable()
    }
}



// MARK: - LaunchesView_Previews

struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        let model = LaunchesViewModel()
        let launch = LaunchesCellViewModel(
            name: "FalconSet",
            details: "Falcon 9 is a reusable, two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of people and payloads into Earth orbit and beyond. Falcon 9 is the world’s first orbital class reusable rocket.",
            launchYear: "2006",
            imageURL: "")
        
        model.launches.append(launch)
        
        return LaunchesView(
            model: model
        )
    }
}
