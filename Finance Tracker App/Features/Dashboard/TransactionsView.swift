//
//  TransactionsView.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 09/05/26.
//
import SwiftUI
import SwiftData
import Combine
import SwiftUI
import SwiftData

struct TransactionsView: View {
    
    @Environment(\.modelContext)
    private var modelContext
    
    @State private var viewModel: TransactionsViewModel?
    
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
        _ viewModel: TransactionsViewModel
    ) -> some View {
        
        VStack {
            
            Button("Add Dummy Transaction") {
                viewModel.addDummyTransaction()
            }
            .padding()
            
            List {
                
                ForEach(viewModel.transactions) { transaction in
                    
                    VStack(alignment: .leading) {
                        
                        Text(transaction.title)
                            .font(.headline)
                        
                        Text(transaction.category)
                        
                        Text("₹\(transaction.amount)")
                    }
                }
                .onDelete(
                    perform: viewModel.deleteTransaction
                )
            }
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func setupViewModel() {
        
        let persistenceService =
        SwiftDataPersistenceService(
            modelContext: modelContext
        )
        
        let vm = TransactionsViewModel(
            persistenceService: persistenceService
        )
        
        vm.loadTransactions()
        
        self.viewModel = vm
    }
}
