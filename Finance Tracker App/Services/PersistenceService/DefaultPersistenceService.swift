//
//  DefaultPersistenceService.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import Foundation

final class DefaultPersistenceService: PersistenceService {
    
    private let userDefaults = UserDefaults.standard
    
    func save<T: Codable>(_ object: T, forKey key: String) {
        let data = try? JSONEncoder().encode(object)
        userDefaults.set(data, forKey: key)
    }
    
    func fetch<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = userDefaults.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
