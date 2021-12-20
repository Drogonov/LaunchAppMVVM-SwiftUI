//
//  Loader.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 20.12.2021.
//

import SwiftUI

struct Loader: View {
    @State private var animate: Bool = false
    var color = Color(UIColor.label)
    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(
                color,
                style: StrokeStyle(lineWidth: 2, lineCap: .round)
            )
            .frame(width: 28, height: 28)
            .rotationEffect(Angle(degrees: animate ? -360 : 0))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 1, z: 0))
            .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            .onAppear {
                animate.toggle()
            }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
