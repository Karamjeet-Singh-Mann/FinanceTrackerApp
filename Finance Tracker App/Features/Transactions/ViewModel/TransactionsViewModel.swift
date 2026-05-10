//
//  TransactionsViewModel.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 09/05/26.
//
import Foundation
import Combine
import Foundation

@MainActor
final class TransactionsViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    private var persistenceService: PersistenceService?
    
    init() {}
    
    func configure(
        persistenceService: PersistenceService
    ) {
        self.persistenceService = persistenceService
    }
    
    func loadTransactions() {
        
        guard let persistenceService else { return }
        
        do {
            transactions =
            try persistenceService.fetchTransactions()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteTransaction(at offsets: IndexSet) {
        
        guard let persistenceService else { return }
        
        do {
            
            for index in offsets {
                
                let transaction = transactions[index]
                
                try persistenceService.deleteTransaction(
                    transaction
                )
            }
            
            loadTransactions()
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
