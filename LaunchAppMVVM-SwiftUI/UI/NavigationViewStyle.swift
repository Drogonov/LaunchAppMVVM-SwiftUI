//
//  NavigationViewStyle.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 20.12.2021.
//

import Foundation
import SwiftUI

struct NavigationViewComponents {
    var navigationTitle: String
    var leftBarButtonTapped: () -> Void
    var rightBarButtonTapped: () -> Void
}

extension View {
    @ViewBuilder
    func navigationBarStyle(components: NavigationViewComponents) -> some View {
        modifier(NavigationViewStyle(components: components))
    }
}

struct NavigationViewStyle: ViewModifier {
    var components: NavigationViewComponents
    
    func body(content: Content) -> some View {
        NavigationView {
            content
                .navigationTitle(components.navigationTitle)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        configureLeftBarButton()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        configureRightBarButton()
                    }
                }
        }
    }
}

// MARK: - Helper Functions

extension NavigationViewStyle {
    private func configureRightBarButton() -> some View {
        Button {
            components.rightBarButtonTapped()
        } label: {
            Image(systemName: "gear")
                .foregroundColor(Color(UIColor.primaryTextColor))
        }
    }
    
    private func configureLeftBarButton() -> some View {
        Button {
            components.leftBarButtonTapped()
        } label: {
            Text("Reload")
                .foregroundColor(Color(UIColor.primaryTextColor))
        }
    }
}
