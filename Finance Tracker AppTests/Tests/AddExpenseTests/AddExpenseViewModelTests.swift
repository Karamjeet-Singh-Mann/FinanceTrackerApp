//
//  AddExpenseViewModelTests.swift
//  Finance Tracker AppTests
//
//  Created by Karamjeet singh on 04/06/26.
//

import XCTest
@testable import Finance_Tracker_App

@MainActor
final class AddExpenseViewModelTests: XCTestCase {
    
    func testSaveExpenseSuccess() {
        
        let persistence =
        MockPersistenceService()
        
        let aiService =
        MockAIService()
        
        let viewModel =
        AddExpenseViewModel()
        
        viewModel.configure(
            persistenceService: persistence,
            aiService: aiService
        )
        
        viewModel.title = "Coffee"
        viewModel.amount = "250"
        viewModel.category = "Food"
        
        let result =
        viewModel.saveExpense()
        
        XCTAssertTrue(result)
        
        XCTAssertEqual(
            persistence.transactions.count,
            1
        )
    }
    
    func testSaveExpenseFailsWithEmptyTitle() {
        
        let persistence =
        MockPersistenceService()
        
        let aiService =
        MockAIService()
        
        let viewModel =
        AddExpenseViewModel()
        
        viewModel.configure(
            persistenceService: persistence,
            aiService: aiService
        )
        
        viewModel.amount = "100"
        
        let result =
        viewModel.saveExpense()
        
        XCTAssertFalse(result)
    }
    
    func testAutoCategorize() {
        
        let persistence =
        MockPersistenceService()
        
        let aiService =
        MockAIService()
        
        let viewModel =
        AddExpenseViewModel()
        
        viewModel.configure(
            persistenceService: persistence,
            aiService: aiService
        )
        
        viewModel.title = "Starbucks"
        
        viewModel.autoCategorize()
        
        XCTAssertEqual(
            viewModel.category,
            "Food"
        )
    }
}
