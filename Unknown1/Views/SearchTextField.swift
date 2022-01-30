//
//  SearchTextField.swift
//  Unknown1
//
//  Created by Alexander Ryakhin on 1/29/22.
//

import SwiftUI

struct SearchTextField: View {
    var title: String
    @Binding var searchText: String
    @Binding var isSearching: Bool
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("SearchSecondary"))
                TextField(title, text: $searchText) { isEditing in
                    withAnimation {
                        self.isSearching = !searchText.isEmpty || isEditing
                    }
                }
                if !searchText.isEmpty {
                    Button {
                        searchText.removeAll()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .foregroundColor(Color("SearchSecondary"))
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 7.5)
            .background(Color("SearchBackground"))
            .cornerRadius(8)

            if isSearching {
                Button {
                    withAnimation {
                        searchText = ""
                        isSearching = false
                        hideKeyboard()
                    }
                } label: {
                    Text("Cancel")
                }
                .transition(AnyTransition.move(edge: .trailing))
            }
        }
        .padding(10)
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(title: "Search", searchText: .constant(""), isSearching: .constant(false))
    }
}

