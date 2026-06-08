//
//  TransactionsView.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 09/05/26.
//
import SwiftUI
import SwiftData
import Combine


struct TransactionsView: View {
    
    @Environment(\.modelContext)
    private var modelContext
    
    @StateObject
    private var viewModel = TransactionsViewModel()
    
    @State private var showAddExpense = false
    
    var body: some View {
        if viewModel.transactions.isEmpty {
            
            EmptyStateView(
                title: "No Expenses Yet",
                message: "Add your first expense to get started.",
                systemImage: "tray"
            ).onAppear {
                setupViewModel()
            }
            
        } else {
            
            List {
                
                ForEach(viewModel.transactions) { transaction in
                    
                    VStack(alignment: .leading) {
                        
                        Text(transaction.title)
                            .font(.headline)
                        
                        Text(transaction.category)
                        
                        Text("₹\(String(format: "%.2f", transaction.amount))")
                    }.accessibilityElement(
                        children: .combine
                    )
                }
                .onDelete(
                    perform: viewModel.deleteTransaction
                )
            }.refreshable {
                viewModel.loadTransactions()
            }
            .navigationTitle("Transactions")
                .toolbar {
                    
                    ToolbarItem(
                        placement: .topBarTrailing
                    ) {
                        
                        Button {
                            showAddExpense = true
                        } label: {
                            Image(systemName: "plus")
                        }.accessibilityLabel(
                            "Add Expense"
                        )

                    }
                }
                .sheet(
                    isPresented: $showAddExpense,
                    onDismiss: {
                        viewModel.loadTransactions()
                    }
                ) {
                    AddExpenseView(
                        container: DIContainer()
                    )
                }
        }

        
      
    }
    
    private func setupViewModel() {
        
        let service =
        SwiftDataPersistenceService(
            modelContext: modelContext
        )
        
        viewModel.configure(
            persistenceService: service
        )
        
        viewModel.loadTransactions()
    }
}
