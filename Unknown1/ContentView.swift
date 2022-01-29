//
//  ContentView.swift
//  Unknown1
//
//  Created by Alexander Ryakhin on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: TabCase = .words
    @State private var isSearching = false
        
    var body: some View {
        NavigationView {
            ZStack {
                background
                switch selection {
                case .words:
                    WordsListView(isSearching: $isSearching)
                case .idioms:
                    IdiomsListView(isSearching: $isSearching)
                case .quizzes:
                    GamesListView()
                }
                if !isSearching {
                    VStack(spacing: 0) {
                        Spacer()
                        tabBar
                    }
                }
            }
            .navigationBarHidden(true)
            selectItemIpad
        }
    }
    
    private var background: some View {
        Color("ListBackground")
            .ignoresSafeArea()
    }
    
    private var tabBar: some View {
        HStack(spacing: 0) {
            ForEach(TabCase.allCases, id: \.self) { tabCase in
                Button {
                    selection = tabCase
                } label: {
                    VStack(spacing: -5) {
                        Image(systemName: tabCase.image)
                            .font(.system(size: 20))
                            .padding()
                        Text(tabCase.name)
                            .font(.caption2)
                            .fixedSize()
                    }
                    .foregroundColor(selection == tabCase ? .accentColor : .secondary)
                    .frame(maxWidth: .infinity)
                    .background(Color("Clear"))
                }
                .buttonStyle(StaticButtonStyle())
            }
        }
        .padding(.top, -5)
        .padding(.horizontal, 30)
        .background(VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial)).ignoresSafeArea())
    }
    
    private var selectItemIpad: some View {
        ZStack {
            Color("DetailsBackground")
                .ignoresSafeArea()
                Text("Select an item")
                    .font(.system(.headline, design: .rounded))
                    .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
