//
//  AddExpenseViewModel.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 10/05/26.
//

import Foundation
import Combine

@MainActor
final class AddExpenseViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var amount = ""
    @Published var category = "Food"
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    let categories = [
        "Food",
        "Travel",
        "Shopping",
        "Bills",
        "Entertainment",
        "Health"
    ]
    
    private var persistenceService: PersistenceService?
    private var aiService: AIService?
    
    init() {}
    
    func configure(
        persistenceService: PersistenceService,
        aiService: AIService
    ) {
        self.persistenceService =
        persistenceService
        
        self.aiService = aiService
    }
    
    func autoCategorize() {
        
        guard let aiService else { return }
        
        guard !title.isEmpty else { return }
        
        let suggestion =
        aiService.suggestCategory(
            for: title
        )
        
        category = suggestion
    }
    
    func saveExpense() -> Bool {
        
        guard let persistenceService else {
            return false
        }
        
        guard !title.trimmingCharacters(
            in: .whitespaces
        ).isEmpty else {
            
            errorMessage = "Please enter title"
            showError = true
            
            return false
        }
        
        guard let amountValue = Double(amount),
              amountValue > 0 else {
            
            errorMessage = "Please enter valid amount"
            showError = true
            
            return false
        }
        
        do {
            
            try persistenceService.saveTransaction(
                title: title,
                amount: amountValue,
                category: category
            )
            
            return true
            
        } catch {
            
            errorMessage = error.localizedDescription
            showError = true
            
            return false
        }
    }
}
