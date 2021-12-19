//
//  CapsulesView.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 18.12.2021.
//

import SwiftUI

struct CapsulesView: View {
    
    // MARK: - Properties
    @EnvironmentObject var router: Router
    @ObservedObject var model: CapsulesViewModel
    @State var selection: Int? = nil
    
    // MARK: - Construction
    
    var body: some View {
        let layout = [
            GridItem(
                .adaptive(
                    minimum: Display.width / 2 - 20,
                    maximum: Display.width / 2
                ),
                spacing: 8
            )
        ]
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, alignment: .center, spacing: 8) {
                    ForEach(model.capsules, id: \.id) { capsule in
                        configureCapsuleCell(capsule: capsule)
                    }
                }
                .padding(5)
            }
            .navigationTitle(model.navigationTitle)
            .toolbar {
                Button {
                    router.route = .settings(type: .capsules)
                } label: {
                    Image(systemName: "gear")
                        .foregroundColor(Color(UIColor.primaryTextColor))
                }
            }
        }
        .onAppear {
            model.loadCapsules()
        }
    }
}

// MARK: - Helper Functions

extension CapsulesView {
    func configureCapsuleCell(capsule: CapsuleCellViewModel) -> some View {
        return VStack(alignment: .center, spacing: 16) {
            let model = CapsuleDetailsViewModel(model: CapsuleDetailsModel(serial: capsule.capsuleName))
            
            Button {
                debugPrint("Status button pressed \(capsule.id)")
            } label: {
                Circle()
                    .frame(width: Constant.capsuleStatusButtonSize, height: Constant.capsuleStatusButtonSize)
                    .foregroundColor(capsule.statusButtonColor)
            }
            .shadow(radius: 2)
            .padding(.top, 16)
            
            NavigationLink(
                destination: CapsuleDetailsView(model: model),
                tag: 1,
                selection: $selection
            ) {
                Button {
                    self.selection = 1
                } label: {
                    Text(capsule.capsuleEmoji)
                        .font(Font.system(size: 64, weight: .bold, design: .default))
                        .frame(
                            width: Constant.capsuleImageViewSize,
                            height: Constant.capsuleImageViewSize
                        )
                        .background(Color(UIColor.backgroundColor))
                        .cornerRadius(Constant.capsuleImageViewSize / 2)
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: Constant.capsuleImageViewSize / 2
                            )
                                .stroke(Color.primaryTextColor, lineWidth: 2)
                        )
                }
            }
            
            Text(capsule.capsuleName)
            
            Spacer()
            
        }
        .frame(
            width: Display.width / 2 - 20
        )
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

// MARK: - Constants

extension CapsulesView {
    private enum Constant {
        static let capsuleStatusButtonSize: CGFloat = 16
        static let capsuleImageViewSize: CGFloat = 120
    }
}

struct CapsulesView_Previews: PreviewProvider {
    static var previews: some View {
        let model = CapsulesViewModel()
        let capsule1 = CapsuleCellViewModel(
            statusButtonColor: .green,
            capsuleName: "ST 666",
            capsuleEmoji: "❓"
        )
        let capsule2 = CapsuleCellViewModel(
            statusButtonColor: .red,
            capsuleName: "ST 777",
            capsuleEmoji: "❓"
        )
        model.capsules.append(capsule1)
        model.capsules.append(capsule2)
        
        return CapsulesView(
            model: model
        )
    }
}
