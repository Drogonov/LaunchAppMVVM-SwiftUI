//
//  SettingsView.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 19.12.2021.
//

import SwiftUI
import GXTextField
import GXUtilz

struct SettingsView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var router: Router
    @ObservedObject var model: SettingsViewModel
    @State private var showingAlert = false
    @State var selection: Int? = nil
    @State var text: String = ""

    // MARK: - Construction
    
    var body: some View {
        NavigationView {
            VStack {
                configureTextEditor()
                Spacer()
                configureNavigationButton()
                configureConfirmButton()
            }
            .navigationTitle(model.navigationTitle)
        }
        .onDisappear {
            router.route = .mainTabBar
        }
        .alert(isPresented: self.$showingAlert) {
            configureAlert()
        }
    }
}

// MARK: - Helper Functions

extension SettingsView {
    func configureTextEditor() -> some View {
        TextEditor(text: .constant(model.text))
            .font(Font.bodyFont)
            .padding(.horizontal, Constants.standartPadding)
    }
    
    func configureConfirmButton() -> some View {
        Button {
            showingAlert = true
        } label: {
            Text(model.buttonText)
                .padding(.horizontal, LocalConstants.buttonPaddingHorizontal)
                .frame(height: Constants.buttonHeight)
                .foregroundColor(Color.backgroundColor)
                .background(Color.accentColor)
                .cornerRadius(Constants.cornerRadius)
        }
    }
    
    func configureAlert() -> Alert {
        Alert(
            title: Text("You confirmed new settings!"),
            message: Text("Now your app is updated"),
            dismissButton: .default(Text("OK"), action: {
                self.showingAlert = false
            })
        )
    }
    
    func configureNavigationButton() -> some View {
        NavigationLink(
            destination: TextFieldTestView(),
            tag: 1,
            selection: $selection
        ) {
            Button {
                selection = 1
            } label: {
                Text("Try some TextFields")
                    .padding(.horizontal, LocalConstants.buttonPaddingHorizontal)
                    .frame(height: Constants.buttonHeight)
                    .foregroundColor(Color.backgroundColor)
                    .background(Color.orange)
                    .cornerRadius(Constants.cornerRadius)
            }
        }
    }
}

// MARK: - Constants

extension SettingsView {
    private enum LocalConstants {
        static let buttonPaddingHorizontal: CGFloat = 80
    }
}

// MARK: - SettingsView_Previews

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            model: SettingsViewModel(
                type: .launches
            )
        )
    }
}


