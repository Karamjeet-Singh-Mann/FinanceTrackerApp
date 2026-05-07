//
//  APIClient.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import Foundation

protocol APIClient {
    func request<T: Decodable>(
        _ endpoint: Endpoint
    ) async throws -> T
}
