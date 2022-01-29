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
    @State private var isEditing = false
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("SearchSecondary"))
                TextField(title, text: $searchText) { isEditing in
                    withAnimation {
                        NotificationCenter.default.post(name: Notification.Name.isSearching, object: nil, userInfo: ["isSearching": isEditing])
                        self.isEditing = isEditing
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
            .padding(.vertical, 5)
            .background(Color("SearchBackground"))
            .cornerRadius(8)

            if isEditing {
                Button {
                    withAnimation {
                        searchText = ""
                        isEditing = false
                        NotificationCenter.default.post(name: Notification.Name.isSearching, object: nil, userInfo: ["isSearching": isEditing])
                        hideKeyboard()
                    }
                } label: {
                    Text("Cancel")
                }
            }
        }
        .padding()
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(title: "Search", searchText: .constant(""))
    }
}

func hideKeyboard() {
    UIApplication.shared.sendAction(
        #selector(UIResponder.resignFirstResponder),
        to: nil, from: nil, for: nil)
}

extension Notification.Name {
    static var isSearching = Self("com.publisher.combine.isSearching")
}
