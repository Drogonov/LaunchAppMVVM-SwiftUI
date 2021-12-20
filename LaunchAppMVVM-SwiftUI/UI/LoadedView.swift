//
//  LoadedView.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 20.12.2021.
//

import SwiftUI

struct LoadedView<SuccessView: View>: View {
    
    // MARK: - Properties

    @Binding var loadState: LoadState
    var successView: SuccessView
    
    // MARK: - Construction
    
    var body: some View {
        VStack {
            switch loadState {
            case .loading:
                Loader(color: .red)
            case .success:
                successView
                    .animation(.easeInOut)
            default:
                Image(systemName: "arrow.clockwise")
                    .renderingMode(.template)
                    .foregroundColor(.primaryTextColor)
                    .font(.titleFont)
                    .animation(.easeInOut)
            }
        }
    }
}
