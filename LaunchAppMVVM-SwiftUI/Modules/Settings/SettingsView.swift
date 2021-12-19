//
//  SettingsView.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 19.12.2021.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    
    @ObservedObject var model: SettingsViewModel
    var confirmButtonAction: () -> Void
    
    // MARK: - Construction
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: .constant(model.text))
                    .font(Constant.font)
                    .padding(.horizontal, Constant.textPaddingHorizontal)
                
                Spacer()
                
                Button {
                    confirmButtonAction()
                } label: {
                    Text(model.buttonText)
                        .padding(.horizontal, Constant.buttonPaddingHorizontal)
                        .frame(height: Constant.buttonHeight)
                        .foregroundColor(Color(UIColor.primaryTextColor)
                        )
                        .background(Color(UIColor.accentColor))
                        .cornerRadius(Constant.cornerRadius)
                }
            }
            .navigationTitle(model.navigationTitle)
        }
    }
}

// MARK: - Constants

extension SettingsView {
    private enum Constant {
        static let font = Font.system(size: 16)
        static let cornerRadius: CGFloat = 10
        static let buttonHeight: CGFloat = 40
        static let buttonPaddingHorizontal: CGFloat = 80
        static let textPaddingHorizontal: CGFloat = 16
    }
}

// MARK: - SettingsView_Previews

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            model: SettingsViewModel(
                type: .launches
            ),
            confirmButtonAction: {}
        )
    }
}


