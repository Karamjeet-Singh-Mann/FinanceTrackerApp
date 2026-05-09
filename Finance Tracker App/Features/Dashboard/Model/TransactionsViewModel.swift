//
//  TransactionsViewModel.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 09/05/26.
//
import Foundation
import Combine

@MainActor
final class TransactionsViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    private let persistenceService: PersistenceService
    
    init(persistenceService: PersistenceService) {
        self.persistenceService = persistenceService
    }
    
    func loadTransactions() {
        
        do {
            transactions = try persistenceService.fetchTransactions()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addDummyTransaction() {
        
        do {
            
            try persistenceService.saveTransaction(
                title: "Coffee",
                amount: 250,
                category: "Food"
            )
            
            loadTransactions()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteTransaction(at offsets: IndexSet) {
        
        do {
            
            for index in offsets {
                
                let transaction = transactions[index]
                
                try persistenceService.deleteTransaction(transaction)
            }
            
            loadTransactions()
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
