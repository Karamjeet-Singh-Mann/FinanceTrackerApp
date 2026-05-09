//
//  Transaction.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 09/05/26.
//

import Foundation
import SwiftData

@Model
final class Transaction {
    
    var id: UUID
    var title: String
    var amount: Double
    var category: String
    var date: Date
    
    init(
        id: UUID = UUID(),
        title: String,
        amount: Double,
        category: String,
        date: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.amount = amount
        self.category = category
        self.date = date
    }
}
