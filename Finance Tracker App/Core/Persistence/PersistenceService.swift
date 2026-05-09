//
//  PersistenceService.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//

import Foundation

protocol PersistenceService {
    
    func saveTransaction(
        title: String,
        amount: Double,
        category: String
    ) throws
    
    func fetchTransactions() throws -> [Transaction]
    
    func deleteTransaction(_ transaction: Transaction) throws
}
