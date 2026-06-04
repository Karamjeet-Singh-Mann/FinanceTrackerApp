//
//  MockPersistenceService.swift
//  Finance Tracker AppTests
//
//  Created by Karamjeet singh on 04/06/26.
//

import Foundation

@testable import Finance_Tracker_App

final class MockPersistenceService: PersistenceService {
    
    var transactions: [Transaction] = []
    
    func saveTransaction(
        title: String,
        amount: Double,
        category: String
    ) throws {
        
        let transaction = Transaction(
            title: title,
            amount: amount,
            category: category
        )
        
        transactions.append(transaction)
    }
    
    func fetchTransactions() throws -> [Transaction] {
        transactions
    }
    
    func deleteTransaction(
        _ transaction: Transaction
    ) throws {
        
        transactions.removeAll {
            $0.id == transaction.id
        }
    }
}
