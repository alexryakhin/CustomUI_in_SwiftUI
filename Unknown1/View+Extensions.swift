//
//  View+Extensions.swift
//  Unknown1
//
//  Created by Alexander Ryakhin on 1/29/22.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil)
    }
}
