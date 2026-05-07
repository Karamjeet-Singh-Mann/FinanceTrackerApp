//
//  Endpoint.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import Foundation

struct Endpoint {
    
    let path: String
    let method: HTTPMethod
    let headers: [String: String]?
    let body: Data?
    let queryItems: [URLQueryItem]?
    
    init(
        path: String,
        method: HTTPMethod = .GET,
        headers: [String: String]? = nil,
        body: Data? = nil,
        queryItems: [URLQueryItem]? = nil
    ) {
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
        self.queryItems = queryItems
    }
}
