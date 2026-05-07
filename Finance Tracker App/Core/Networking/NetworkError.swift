//
//  NetworkError.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 07/05/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    
    case invalidURL
    case invalidResponse
    case decodingFailed
    case serverError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
            
        case .invalidResponse:
            return "Invalid Response"
            
        case .decodingFailed:
            return "Failed to decode response"
            
        case .serverError(let code):
            return "Server error with status code: \(code)"
        }
    }
}
