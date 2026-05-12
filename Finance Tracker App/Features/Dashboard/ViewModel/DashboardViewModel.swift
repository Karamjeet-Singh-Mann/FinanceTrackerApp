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
    
    private var persistenceService: PersistenceService?
    
    init() {}
    
    func configure(
        persistenceService: PersistenceService
    ) {
        self.persistenceService = persistenceService
    }
    
    func loadDashboardData() {
        
        guard let persistenceService else { return }
        
        do {
            
            transactions =
            try persistenceService.fetchTransactions()
            
        } catch {
            print(error.localizedDescription)
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
