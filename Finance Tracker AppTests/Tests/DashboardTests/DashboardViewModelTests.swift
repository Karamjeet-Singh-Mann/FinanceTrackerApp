//
//  DashboardViewModelTests.swift
//  Finance Tracker AppTests
//
//  Created by Karamjeet singh on 04/06/26.
//

import Foundation

import XCTest
@testable import Finance_Tracker_App

@MainActor
final class DashboardViewModelTests:
    XCTestCase {
    
    func testTotalExpenses() {
        
        let persistence =
        MockPersistenceService()
        
        try? persistence.saveTransaction(
            title: "Coffee",
            amount: 100,
            category: "Food"
        )
        
        try? persistence.saveTransaction(
            title: "Movie",
            amount: 200,
            category: "Entertainment"
        )
        
        let vm =
        DashboardViewModel()
        
        vm.configure(
            persistenceService: persistence
        )
        
        vm.loadDashboardData()
        
        XCTAssertEqual(
            vm.totalExpenses,
            300
        )
    }
}
