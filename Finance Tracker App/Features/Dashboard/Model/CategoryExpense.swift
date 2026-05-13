//
//  CategoryExpense.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 13/05/26.
//

import Foundation

struct CategoryExpense: Identifiable {
    
    let id = UUID()
    let category: String
    let total: Double
}
