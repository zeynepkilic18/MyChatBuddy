//
//  ContentView.swift
//  ChatBuddy
//
//  Created by Zeynep Kılıç on 23.02.2026.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.05).ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    
                    VStack(spacing: 15) {
                        Text("🤖").font(.system(size: 80))
                        Text("ChatBuddy")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                        Text("Senin akıllı mühendislik arkadaşın.").font(.subheadline)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ChatView()) {
                        HStack {
                            Text("Sohbete Başla")
                            Image(systemName: "arrow.right.circle.fill")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 260, height: 60)
                        .background(Color.blue)
                        .cornerRadius(30)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
