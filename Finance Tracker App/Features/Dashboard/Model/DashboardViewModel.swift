//
//  DashboardViewModel.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 07/05/26.
//
import Foundation
import Combine

@MainActor
final class DashboardViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchProducts() async {
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let endpoint = Endpoint(path: "/products")
            
            let response: ProductsResponse =
                try await apiClient.request(endpoint)
            
            self.products = response.products
            
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
