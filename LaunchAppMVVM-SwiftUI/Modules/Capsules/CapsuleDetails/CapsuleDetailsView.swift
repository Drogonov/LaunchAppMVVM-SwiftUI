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
        List {
            ForEach(model.capsuleValues, id: \.self) { value in
                configureCapsuleDetailsCell(with: value)
            }
        }
        .navigationTitle(model.navigationTitle)
        .onAppear {
            model.loadCapsule()
        }
    }
}

// MARK: - Helper Function

extension CapsuleDetailsView {
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
