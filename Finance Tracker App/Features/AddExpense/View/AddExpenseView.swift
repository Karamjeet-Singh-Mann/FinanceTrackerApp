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
    
    @State private var viewModel:
    AddExpenseViewModel?
    
    
    var body: some View {
        
        Group {
            
            if let viewModel {
                
                content(viewModel)
                
            } else {
                
                ProgressView()
                    .onAppear {
                        setupViewModel()
                    }
            }
        }
    }
    
    @ViewBuilder
    private func content(
        _ viewModel: AddExpenseViewModel
    ) -> some View {
        
        NavigationStack {
            
            Form {
                
                Section("Expense Details") {
                    
                    ExpenseTextField(
                        title: "Title",
                        text: Binding(
                            get: { viewModel.title },
                            set: { viewModel.title = $0 }
                        )
                    )
                    
                    ExpenseTextField(
                        title: "Amount",
                        text: Binding(
                            get: { viewModel.amount },
                            set: { viewModel.amount = $0 }
                        ),
                        keyboardType: .decimalPad
                    )
                }
                
                Section("Category") {
                    
                    Picker(
                        "Category",
                        selection: Binding(
                            get: { viewModel.category },
                            set: { viewModel.category = $0 }
                        )
                    ) {
                        
                        ForEach(
                            viewModel.categories,
                            id: \.self
                        ) { category in
                            
                            Text(category)
                        }
                    }
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
                isPresented: Binding(
                    get: { viewModel.showError },
                    set: { viewModel.showError = $0 }
                )
            ) {
                Button("OK") {}
            } message: {
                Text(viewModel.errorMessage)
            }
        }
    }
    
    private func setupViewModel() {
        
        let service =
        SwiftDataPersistenceService(
            modelContext: modelContext
        )
        
        self.viewModel =
        AddExpenseViewModel(
            persistenceService: service
        )
    }
}

#Preview {
    AddExpenseView()
}
