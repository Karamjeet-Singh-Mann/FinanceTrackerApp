//
//  AppCoordinatorView.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import SwiftUI

struct AppCoordinatorView: View {
    
    
    @ObservedObject var coordinator: AppCoordinator
    let container: DIContainer
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
           DashboardView(container: container)
       }
    }
}

