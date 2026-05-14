//
//  DIContainer.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import Foundation
import Combine

final class DIContainer: ObservableObject {
    
    let apiClient: APIClient
    let aiService: AIService
    
    init() {
        
        self.apiClient =
        DefaultAPIClient()
        
        self.aiService =
        DefaultAIService()
    }
}
