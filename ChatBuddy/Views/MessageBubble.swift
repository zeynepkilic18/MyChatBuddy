//
//  MessageBubble.swift
//  ChatBuddy
//
//  Created by Zeynep Kılıç on 25.02.2026.
//
import SwiftUI

struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isUser { Spacer() }
            
            Text(message.text)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    message.isUser ?
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                )
                .foregroundColor(message.isUser ? .white : .primary)
                .clipShape(ChatBubbleShape(isUser: message.isUser))
                .shadow(color: message.isUser ? Color.blue.opacity(0.2) : Color.clear, radius: 5, x: 0, y: 3)
            
            if !message.isUser { Spacer() }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct ChatBubbleShape: Shape {
    var isUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight, isUser ? .bottomLeft : .bottomRight],
                                cornerRadii: CGSize(width: 15, height: 15))
        return Path(path.cgPath)
    }
}

#Preview {
    MessageBubble(message: .example)
}
