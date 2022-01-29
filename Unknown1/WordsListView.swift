//
//  WordsListView.swift
//  Unknown1
//
//  Created by Alexander Ryakhin on 1/29/22.
//

import SwiftUI

struct WordsListView: View {
    @State private var searchText = ""
    @Binding var isSearching: Bool
    
    var body: some View {
        ZStack {
            content.shadow(radius: 4)
            VStack(spacing: 0) {
                navBar
                Spacer()
            }
        }
    }
    
    private var navBar: some View {
        VStack(spacing: 0) {
            if !isSearching {
                HStack {
                    Text("Words")
                        .font(.system(.headline, design: .rounded))
                        .padding(.top)
                }
            }
            SearchTextField(title: "Search", searchText: $searchText, isSearching: $isSearching)
        }
        .frame(maxWidth: .infinity)
        .background(VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial)).ignoresSafeArea())
    }
    
    private var content: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(0..<20) { index in
                    NavigationLink {
                        DetailsView(index: index)
                    } label: {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                Text("Word \(index)")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.primary)
                            .padding()
                            Divider().opacity(index == 19 ? 0 : 1)
                            
                            
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .buttonStyle(.automatic)
                }
            }
            .background(VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial)).ignoresSafeArea())
            .cornerRadius(15)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, isSearching ? 55 : 92)
            .padding(.bottom, isSearching ? 0 : 55)
        }
    }
}

struct WordsListView_Previews: PreviewProvider {
    static var previews: some View {
        WordsListView(isSearching: .constant(false))
    }
}
