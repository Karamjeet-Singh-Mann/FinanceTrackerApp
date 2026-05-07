//
//  DIContainer.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import Foundation

final class DIContainer {
    
    // MARK: - Services
    let apiClient: APIClient
    let persistenceService: PersistenceService
    
    // MARK: - Init
    init() {
        self.apiClient = DefaultAPIClient()
        self.persistenceService = DefaultPersistenceService()
    }
}
