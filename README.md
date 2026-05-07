Finance Tracker 💰
An AI-powered personal finance tracking iOS application built with modern iOS architecture and scalable engineering practices.
🚀 Features
📊 Expense Dashboard & Analytics
➕ Add / Delete Transactions
🔍 Search & Filter Transactions
💾 Offline-first Persistence
🤖 AI-powered Expense Categorization
🌙 Dark Mode Support
📈 Charts & Spending Insights
⚡ Async/Await Networking
🧪 Unit Testable Architecture
🧱 Architecture
The app follows a scalable and modular architecture:
MVVM + Coordinator Pattern
Dependency Injection
Feature-based folder structure
Service abstraction
Protocol-oriented design
📁 Project Structure
FinanceTracker/
│
├── App/
│   ├── FinanceTrackerApp.swift
│   ├── AppCoordinator.swift
│   ├── AppCoordinatorView.swift
│   └── DIContainer.swift
│
├── Core/
│   ├── Networking/
│   ├── Persistence/
│   ├── Utilities/
│   ├── Extensions/
│   └── DesignSystem/
│
├── Features/
│   ├── Dashboard/
│   ├── Transactions/
│   ├── AddExpense/
│   └── Analytics/
│
├── Services/
│   ├── APIService/
│   ├── PersistenceService/
│   └── AIService/
│
├── Resources/
│
└── Tests/
    ├── UnitTests/
    └── UITests/
    
🧠 Tech Stack
UI
  SwiftUI
  Architecture
  MVVM-C (MVVM + Coordinator)
  Networking
  URLSession
  Async/Await
Persistence
  Core Data
Reactive Programming
  Combine
Testing
  XCTest
CI/CD
  GitHub Actions
📡 Networking Layer
  The networking layer is fully generic and reusable.
  Features:
  Endpoint abstraction
  Request builder
  Typed decoding
  Centralized error handling
  Async/await support
  Example:
  let endpoint = Endpoint(path: "/products")

  let response: ProductsResponse =
      try await apiClient.request(endpoint)
💾 Persistence Strategy
  The application follows an offline-first approach.
  Local caching using Core Data
  Background sync capability
  Repository abstraction for storage layer
🤖 AI Integration
  AI services are used for:
  Smart expense categorization
  Spending insights
  Future recommendation support
  Example:
  “Starbucks” → Automatically categorized as “Food & Drinks”
  🧪 Testing Strategy
  The project is designed for high testability.
Coverage includes:
  ViewModels
  Networking layer
  Persistence services
  Mock services
  Example:
  final class MockAPIClient: APIClient {
      func request<T>(_ endpoint: Endpoint) async throws -> T where T : Decodable {
          mockResponse
      }
  }
🎯 Goals of This Project
  This project was built to demonstrate:
  Production-grade iOS architecture
  Scalable code organization
  Modern Swift concurrency
  Clean dependency injection
  Real-world engineering practices
📸 Screenshots

🎥 Demo

🛠 Future Improvements
  Authentication
  Cloud Sync
  Budget Goals
  Recurring Transactions
  Push Notifications
  Multi-device Sync
  WidgetKit Support
🚀 Getting Started
  Requirements
    Xcode 16+
    iOS 17+
    Swift 6
  Installation
    git clone <your-repo-url>
    cd FinanceTracker
    open FinanceTracker.xcodeproj
    Run the project using Xcode.
📚 Learning Objectives
This project explores:
  Scalable app architecture
  Dependency Injection
  Async/Await
  SwiftUI navigation patterns
  Clean networking abstraction
  Offline-first mobile development
👨‍💻 Author
  Karamjeet Singh
  Senior iOS Developer
