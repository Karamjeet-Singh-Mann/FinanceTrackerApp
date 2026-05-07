//
//  RequestBuilder.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 07/05/26.
//
import Foundation

struct RequestBuilder {
    
    static let baseURL = "https://dummyjson.com"
    
    static func build(from endpoint: Endpoint) throws -> URLRequest {
        
        guard var components = URLComponents(
            string: baseURL + endpoint.path
        ) else {
            throw NetworkError.invalidURL
        }
        
        components.queryItems = endpoint.queryItems
        
        guard let url = components.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        
        endpoint.headers?.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        
        return request
    }
}
