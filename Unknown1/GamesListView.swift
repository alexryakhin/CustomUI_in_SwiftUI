//
//  GamesListView.swift
//  Unknown1
//
//  Created by Alexander Ryakhin on 1/29/22.
//

import SwiftUI

struct GamesListView: View {
    var body: some View {
        ZStack {
            content
            VStack(spacing: 0) {
                navBar
                Spacer()
            }
        }
    }
    
    private var navBar: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Quizzes")
                    .font(.system(.headline, design: .rounded))
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .background(VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial)).ignoresSafeArea())
    }
    
    private var content: some View {
        Text("Games")
    }
}

struct GamesListView_Previews: PreviewProvider {
    static var previews: some View {
        GamesListView()
    }
}
