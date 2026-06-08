//
//  DashboardView.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//
import SwiftUI
import SwiftData

struct DashboardView: View {
    
    let container: DIContainer
    
    @Environment(\.modelContext)
    private var modelContext
    
    @StateObject
    private var viewModel = DashboardViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
  
        } else {
            
            
            NavigationStack {
                
                ScrollView {
                    
                    VStack(
                        alignment: .leading,
                        spacing: 24
                    ) {
                        
                        headerSection
                        
                        balanceCard
                        
                        statsSection
                        
                        analyticsSection
                        
                        insightCard.accessibilityLabel(
                            "Spending Analytics"
                        )
                        
                        recentTransactionsSection
                        
                        actionsSection
                    }
                    .padding()
                }
                .background(
                    Color(.systemGroupedBackground)
                )
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    setupViewModel()
                }.alert(
                    "Something Went Wrong",
                    isPresented: .constant(
                        viewModel.errorMessage != nil
                    )
                ) {
                    
                    Button("OK") {
                        viewModel.errorMessage = nil
                    }
                    
                } message: {
                    
                    Text(
                        viewModel.errorMessage ?? ""
                    )
                }
            }.refreshable {
                viewModel.loadDashboardData()
            }
        }
    }
}

    // MARK: - Setup

private extension DashboardView {
    
    func setupViewModel() {
        
        let service =
        SwiftDataPersistenceService(
            modelContext: modelContext
        )
        
        viewModel.configure(
            persistenceService: service
        )
        
        viewModel.loadDashboardData()
    }
}

    // MARK: - Sections

private extension DashboardView {
    
    var headerSection: some View {
        
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            
            Text("Welcome Back 👋")
                .font(.title3)
                .foregroundStyle(.secondary)
            
            Text("Finance Tracker")
                .font(.largeTitle.bold())
        }
    }
    
    var balanceCard: some View {
        
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            
            Text("Total Expenses")
                .foregroundStyle(.white.opacity(0.8))
            
            Text(
                "₹\(viewModel.totalExpenses, specifier: "%.0f")"
            )
            .font(
                .system(size: 40, weight: .bold)
            )
            
            Text(
                "\(viewModel.totalTransactions) Transactions"
            )
            .foregroundStyle(.white.opacity(0.8))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.blue.gradient)
        .foregroundStyle(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 28)
        )
    }
    
    var statsSection: some View {
        
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            
            Text("Quick Stats")
                .font(.title2.bold())
            
            HStack(spacing: 16) {
                
                DashboardStatCard(
                    title: "Transactions",
                    value: "\(viewModel.totalTransactions)",
                    icon: "creditcard.fill",
                    color: .orange
                )
                
                DashboardStatCard(
                    title: "Categories",
                    value: "6",
                    icon: "square.grid.2x2.fill",
                    color: .purple
                )
            }
        }
    }
    
    var analyticsSection: some View {
        
        ExpenseChartView(
            data: viewModel.categoryExpenses
        )
    }
    
    var insightCard: some View {
        
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            
            Text("Monthly Insight")
                .font(.headline)
            
            Text(
                "Your highest spending category is \(viewModel.categoryExpenses.first?.category ?? "N/A")."
            )
            .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }
    
    var recentTransactionsSection: some View {
        
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            
            HStack {
                
                Text("Recent Transactions")
                    .font(.title2.bold())
                
                Spacer()
                
                NavigationLink("See All") {
                    TransactionsView()
                }
            }
            
            if viewModel.recentTransactions.isEmpty {
                
                ContentUnavailableView(
                    "No Transactions",
                    systemImage: "tray"
                )
                
            } else {
                
                VStack(spacing: 12) {
                    
                    ForEach(
                        viewModel.recentTransactions
                    ) { transaction in
                        
                        RecentTransactionRow(
                            transaction: transaction
                        )
                    }
                }
            }
        }
    }
    
    var actionsSection: some View {
        
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            
            Text("Actions")
                .font(.title2.bold())
            
            NavigationLink {
                TransactionsView()
            } label: {
                
                HStack {
                    
                    Image(
                        systemName:
                            "list.bullet.rectangle"
                    )
                    
                    Text("View Transactions")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.secondary)
                }
                .padding()
                .background(.background)
                .clipShape(
                    RoundedRectangle(cornerRadius: 18)
                )
            }
            .buttonStyle(.plain)
        }
    }
}
