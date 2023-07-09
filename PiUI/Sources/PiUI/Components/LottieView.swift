//
//  SwiftUIView.swift
//  
//
//  Created by Boobalan on 7/8/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var name = "success"
    var completionHandler:(Bool)->()
    var loopMode: LottieLoopMode = .playOnce

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()


        let animation = Animation.named(name, bundle: .module)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play  { isFinished in
            completionHandler(isFinished)
        }

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

