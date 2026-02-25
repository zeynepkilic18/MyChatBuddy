# ChatBuddy 🤖

ChatBuddy is a modern, lightweight chat application built with **SwiftUI**. It serves as an intelligent companion for engineers and developers, featuring a clean user interface and a robust folder structure based on the **MVVM** (Model-View-ViewModel) architectural pattern.

## 🚀 Features

* **Smart Response Logic:** A customized dictionary-based interaction system that understands developer-specific context (projects, AI, engineering life).
* **Modern UI/UX:**
    * Dynamic chat bubbles with custom shapes and gradients.
    * Auto-scrolling message list for a seamless conversation flow.
    * Haptic-ready interactive elements and a clean, minimal input area.
* **Clean Architecture:** Specifically organized into `Models`, `Views`, `ViewModels`, and `Services` for high maintainability.

## 🛠 Tech Stack & Architecture

* **Framework:** SwiftUI
* **Pattern:** MVVM
* **Asynchronous Operations:** GCD (Grand Central Dispatch) for simulated network delays.

## 📸 Screenshots
<img width="361" height="754" alt="Ekran Resmi 2026-02-25 13 17 17" src="https://github.com/user-attachments/assets/a3b7238a-8805-45dc-9bf7-19ae897b05c9" />

<img width="366" height="762" alt="Ekran Resmi 2026-02-25 13 17 51" src="https://github.com/user-attachments/assets/608d0d36-f3d8-48bb-943c-7e6e9383a8d9" />

<img width="365" height="756" alt="Ekran Resmi 2026-02-25 13 27 29" src="https://github.com/user-attachments/assets/34e6b328-c486-45e0-a5f7-9e9f243a526e" />


## 📂 Project Structure

```text
ChatBuddy/
├── App/            # App Entry Point
├── Models/         # Data Structures (Message)
├── ViewModels/     # Business Logic (ChatViewModel)
├── Views/          # UI Components (ChatView, MessageBubble)
└── Services/       # Data & API Management (ChatService)
