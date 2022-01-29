//
//  TabCase.swift
//  Unknown1
//
//  Created by Alexander Ryakhin on 1/29/22.
//

import SwiftUI

enum TabCase: CaseIterable {
    case words
    case idioms
    case quizzes
    
    var image: String {
        switch self {
        case .words:
            return "textformat.abc"
        case .idioms:
            return "scroll"
        case .quizzes:
            return "a.magnify"
        }
    }
    
    var name: String {
        switch self {
        case .words:
            return "Words"
        case .idioms:
            return "Idioms"
        case .quizzes:
            return "Quizzes"
        }
    }
}

struct TabItem: Identifiable {
    var id: Int
    var name: String
    var image: String
}

