//
//  DefaultAPIClient.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import Foundation

final class DefaultAPIClient: APIClient {
    
    func request<T: Decodable>(
        _ endpoint: Endpoint
    ) async throws -> T {
        
        let request = try RequestBuilder.build(from: endpoint)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
