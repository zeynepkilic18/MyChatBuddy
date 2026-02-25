//
//  ChatView.swift
//  ChatBuddy
//
//  Created by Zeynep Kılıç on 25.02.2026.
//

import SwiftUI
import Foundation

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in // Otomatik kaydırma
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.messages) { msg in
                            MessageBubble(message: msg)
                                .id(msg.id)
                        }
                    }
                    .padding(.vertical)
                }
                .onChange(of: viewModel.messages.count) { _ in
                    // Yeni mesaj geldiğinde en aşağıya kaydır
                    withAnimation {
                        proxy.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
                    }
                }
            }
            
            Divider()
            
            HStack(alignment: .bottom, spacing: 12) {
                TextField("Mesaj yaz...", text: $viewModel.currentMessage, axis: .vertical)
                    .padding(12)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                    .lineLimit(1...5)
                    // Enter işlemi
                    .onSubmit {
                        viewModel.sendMessage()
                    }
                
                Button {
                    viewModel.sendMessage()
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.system(size: 38))
                        .foregroundColor(viewModel.currentMessage.isEmpty ? .blue : .blue)
                }
                .disabled(viewModel.currentMessage.isEmpty)
            }
            .padding()
        }
        .navigationTitle("ChatBuddy 🤖")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    ChatView()
}
