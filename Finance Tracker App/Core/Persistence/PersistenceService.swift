//
//  PersistenceService.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import Foundation

protocol PersistenceService {
    func save<T: Codable>(_ object: T, forKey key: String)
    func fetch<T: Codable>(_ type: T.Type, forKey key: String) -> T?
}
