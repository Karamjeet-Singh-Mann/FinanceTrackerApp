//
//  AddExpenseView.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 10/05/26.
//
import SwiftUI
import SwiftData

struct AddExpenseView: View {
    
    @Environment(\.dismiss)
    private var dismiss
    
    @Environment(\.modelContext)
    private var modelContext
    
    @StateObject
    private var viewModel = AddExpenseViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section("Expense Details") {
                    
                    ExpenseTextField(
                        title: "Title",
                        text: $viewModel.title
                    )
                    
                    ExpenseTextField(
                        title: "Amount",
                        text: $viewModel.amount,
                        keyboardType: .decimalPad
                    )
                }
                
                Section("Category") {
                    
                    Picker(
                        "Category",
                        selection: $viewModel.category
                    ) {
                        
                        ForEach(
                            viewModel.categories,
                            id: \.self
                        ) { category in
                            
                            Text(category)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("Add Expense")
            .toolbar {
                
                ToolbarItem(
                    placement: .topBarTrailing
                ) {
                    
                    Button("Save") {
                        
                        let success =
                        viewModel.saveExpense()
                        
                        if success {
                            dismiss()
                        }
                    }
                }
            }
            .alert(
                "Error",
                isPresented: $viewModel.showError
            ) {
                Button("OK") {}
            } message: {
                Text(viewModel.errorMessage)
            }
            .onAppear {
                setupViewModel()
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
    }
}
