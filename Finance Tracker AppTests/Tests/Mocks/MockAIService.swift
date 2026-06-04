//
//  MockAIService.swift
//  Finance Tracker AppTests
//
//  Created by Karamjeet singh on 04/06/26.
//

import Foundation

@testable import Finance_Tracker_App

final class MockAIService: AIService {
    
    func suggestCategory(
        for title: String
    ) -> String {
        "Food"
    }
}
