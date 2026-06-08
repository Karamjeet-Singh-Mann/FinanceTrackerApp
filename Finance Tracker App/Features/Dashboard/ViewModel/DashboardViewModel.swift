//
//  DashboardViewModel.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 07/05/26.
//
import Foundation
import Combine
import Foundation

@MainActor
final class DashboardViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var persistenceService: PersistenceService?
    
    init() {}
    
    func configure(
        persistenceService: PersistenceService
    ) {
        self.persistenceService = persistenceService
    }
    
    func loadDashboardData() {
            
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        guard let persistenceService else { return }
        
        do {
            
            transactions =
            try persistenceService.fetchTransactions()
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

    // MARK: - Analytics

extension DashboardViewModel {
    
    var totalExpenses: Double {
        
        transactions.reduce(0) {
            $0 + $1.amount
        }
    }
    
    var totalTransactions: Int {
        transactions.count
    }
    
    var recentTransactions: [Transaction] {
        Array(transactions.prefix(5))
    }
}

extension DashboardViewModel {
    
    var categoryExpenses: [CategoryExpense] {
        
        let grouped = Dictionary(
            grouping: transactions
        ) {
            $0.category
        }
        
        return grouped.map { category, items in
            
            let total = items.reduce(0) {
                $0 + $1.amount
            }
            
            return CategoryExpense(
                category: category,
                total: total
            )
        }
        .sorted {
            $0.total > $1.total
        }
    }
}
