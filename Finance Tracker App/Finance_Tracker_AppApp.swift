//
//  Finance_Tracker_AppApp.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import SwiftUI
import SwiftData

@main
struct FinanceTrackerApp: App {
    
    private let container = DIContainer()
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(
                coordinator: coordinator,
                container: container
            )
        }
    }
}
