//
//  CapsuleDetailsView.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 19.12.2021.
//

import SwiftUI

struct CapsuleDetailsView: View {
    
    // MARK: - Properties
    
    @ObservedObject var model: CapsuleDetailsViewModel
    
    // MARK: - Construction
    
    var body: some View {
        VStack {
            loadedView()
        }
        .navigationTitle(model.navigationTitle)
        .onAppear {
            model.loadCapsule()
        }
    }
}

// MARK: - Helper Function

extension CapsuleDetailsView {
    
    @ViewBuilder
    private func loadedView() -> some View {
        switch model.loadState {
        case .initial:
            EmptyView()
        case .loading:
            Loader(color: .red)
        case .fail:
            Image(systemName: "arrow.clockwise")
                .renderingMode(.template)
                .foregroundColor(.white)
                .font(.system(size: 22))
                .animation(.default)
        case .success:
            List {
                ForEach(model.capsuleValues, id: \.self) { value in
                    configureCapsuleDetailsCell(with: value)
                }
            }
        }
    }
    
    private func configureCapsuleDetailsCell(with value: CapsuleDetailsCellViewModel) -> some View {
        return HStack(alignment: .top, spacing: 16) {
            Text(value.title + ":")
                .frame(width: 80)
            
            Text(value.value)
            
            Spacer()
        }
    }
}

struct CapsuleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleDetailsView(model: CapsuleDetailsViewModel(model: CapsuleDetailsModel(serial: "666")))
    }
}
