//
//  Untitled.swift
//  ChatBuddy
//
//  Created by Zeynep Kılıç on 25.02.2026.
//

import Foundation
import Combine

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
    
    static let example = Message(text: "Bu bir test mesajıdır.", isUser: true)
    
}
