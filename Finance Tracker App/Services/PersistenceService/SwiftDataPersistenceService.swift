//
//  SwiftDataPersistenceService.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 09/05/26.
//

import SwiftData
import Foundation

final class SwiftDataPersistenceService: PersistenceService {
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
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
        
        modelContext.insert(transaction)
        
        try modelContext.save()
    }
    
    func fetchTransactions() throws -> [Transaction] {
        
        let descriptor = FetchDescriptor<Transaction>(
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
        
        return try modelContext.fetch(descriptor)
    }
    
    func deleteTransaction(_ transaction: Transaction) throws {
        
        modelContext.delete(transaction)
        
        try modelContext.save()
    }
}
