//
//  VisualEffectView.swift
//  FriendNational
//
//  Created by Alexander Ryakhin on 10/31/21.
//  Copyright © 2021 Alexander Ryakhin. All rights reserved.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
