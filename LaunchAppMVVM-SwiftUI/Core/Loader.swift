//
//  Loader.swift
//  LaunchAppMVVM-SwiftUI
//
//  Created by Anton Vlezko on 20.12.2021.
//

import SwiftUI

//struct Loader: View {
//    @State private var animate: Bool = false
//    var color = Color(UIColor.label)
//    var body: some View {
//        Circle()
//            .trim(from: 0.2, to: 1)
//            .stroke(
//                color,
//                style: StrokeStyle(lineWidth: 2, lineCap: .round)
//            )
//            .frame(width: 28, height: 28)
//            .rotationEffect(Angle(degrees: animate ? -360 : 0))
//            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 1, z: 0))
//            .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
//            .onAppear {
//                animate.toggle()
//            }
//    }
//}

struct Loader: View {
    let style = StrokeStyle(lineWidth: 6, lineCap: .round)
    @State var isAnimating = false
    var color = Color(UIColor.label)
    let color2 = Color.gray.opacity(0.5)
    let animation = Animation.linear(duration: 0.7).repeatForever(autoreverses: false)
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(
                    AngularGradient(
                        gradient: .init(colors: [color, color2]),
                        center: .center
                    ),
                    style: style
                )
                .frame(height: 50)
                .rotationEffect(Angle(degrees: isAnimating ? 360: 0))
                .animation(self.isAnimating ? animation : .default, value: isAnimating)
        }.onAppear {
            self.isAnimating.toggle()
        }
        .onDisappear {
            self.isAnimating = false
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
