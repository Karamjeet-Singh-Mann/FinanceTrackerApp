//
//  DefaultAIService.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 14/05/26.
//

import Foundation

final class DefaultAIService: AIService {
    
    func suggestCategory(
        for title: String
    ) -> String {
        
        let lowercased =
        title.lowercased()
        
            // Food
        if lowercased.contains("coffee") ||
            lowercased.contains("pizza") ||
            lowercased.contains("burger") ||
            lowercased.contains("restaurant") ||
            lowercased.contains("swiggy") ||
            lowercased.contains("zomato") {
            
            return "Food"
        }
        
            // Travel
        if lowercased.contains("uber") ||
            lowercased.contains("ola") ||
            lowercased.contains("metro") ||
            lowercased.contains("flight") {
            
            return "Travel"
        }
        
            // Shopping
        if lowercased.contains("amazon") ||
            lowercased.contains("flipkart") ||
            lowercased.contains("mall") {
            
            return "Shopping"
        }
        
            // Entertainment
        if lowercased.contains("netflix") ||
            lowercased.contains("movie") ||
            lowercased.contains("spotify") {
            
            return "Entertainment"
        }
        
        return "Bills"
    }
}
