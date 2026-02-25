//
//  ChatViewModel.swift
//  ChatBuddy
//
//  Created by Zeynep Kılıç on 25.02.2026.
//

import Foundation
import SwiftUI
import Combine

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var currentMessage: String = ""
    
    private let chatService = ChatService()
    
    func sendMessage() {
        // Boş mesaj gönderilmesin
        let trimmedMessage = currentMessage.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedMessage.isEmpty else { return }
        
        let userMsg = Message(text: trimmedMessage, isUser: true)
        messages.append(userMsg)
        
        let messageToSend = trimmedMessage
        currentMessage = ""
        
        chatService.fetchResponse(from: messageToSend) { [weak self] response in
            DispatchQueue.main.async {
                if let botReply = response {
                    let botMsg = Message(text: botReply, isUser: false)
                    self?.messages.append(botMsg)
                }
            }
        }
    }
}
