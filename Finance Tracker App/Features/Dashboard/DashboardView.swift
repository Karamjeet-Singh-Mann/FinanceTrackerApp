//
//  DashboardView.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//
import SwiftUI

struct DashboardView: View {
    
    @StateObject private var viewModel: DashboardViewModel
    
    init(container: DIContainer) {
        _viewModel = StateObject(
            wrappedValue: DashboardViewModel(
                apiClient: container.apiClient
            )
        )
    }
    
    var body: some View {
        
        NavigationView {
            
            Group {
                
                if viewModel.isLoading {
                    ProgressView()
                    
                } else if let error = viewModel.errorMessage {
                    Text(error)
                    
                } else {
                    List(viewModel.products) { product in
                        Text(product.title)
                    }
                }
            }
            .navigationTitle("Dashboard")
        }
        .task {
            await viewModel.fetchProducts()
        }
    }
}
