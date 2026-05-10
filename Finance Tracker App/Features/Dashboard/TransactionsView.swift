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
        
        List {
            
            ForEach(viewModel.transactions) { transaction in
                
                VStack(alignment: .leading) {
                    
                    Text(transaction.title)
                        .font(.headline)
                    
                    Text(transaction.category)
                    
                    Text("₹\(String(format: "%.2f", transaction.amount))")
                }
            }
            .onDelete(
                perform: viewModel.deleteTransaction
            )
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
                }
            }
        }
        .sheet(
            isPresented: $showAddExpense,
            onDismiss: {
                viewModel.loadTransactions()
            }
        ) {
            AddExpenseView()
        }
        .onAppear {
            setupViewModel()
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
