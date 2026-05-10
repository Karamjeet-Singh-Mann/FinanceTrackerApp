//
//  DashboardView.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 30/04/26.
//
import SwiftUI

struct DashboardView: View {
    
    let container: DIContainer
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(
                    alignment: .leading,
                    spacing: 24
                ) {
                    
                    headerSection
                    
                    balanceCard
                    
                    statsSection
                    
                    actionsSection
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(
                Color(.systemGroupedBackground)
            )
        }
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
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var balanceCard: some View {
        
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            
            Text("Total Balance")
                .foregroundStyle(.secondary)
            
            Text("₹24,500")
                .font(.system(size: 40, weight: .bold))
            
            HStack {
                
                Label(
                    "Income +12%",
                    systemImage: "arrow.up.right"
                )
                .font(.subheadline)
                .foregroundStyle(.green)
                
                Spacer()
                
                Label(
                    "Expenses -8%",
                    systemImage: "arrow.down.right"
                )
                .font(.subheadline)
                .foregroundStyle(.red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.blue.gradient)
        .foregroundStyle(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 24)
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
                
                statCard(
                    title: "Transactions",
                    value: "24",
                    icon: "creditcard.fill",
                    color: .orange
                )
                
                statCard(
                    title: "Categories",
                    value: "6",
                    icon: "square.grid.2x2.fill",
                    color: .purple
                )
            }
        }
    }
    
    func statCard(
        title: String,
        value: String,
        icon: String,
        color: Color
    ) -> some View {
        
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(color)
            
            Text(value)
                .font(.title.bold())
            
            Text(title)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
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
                    
                    Image(systemName: "list.bullet.rectangle")
                        .font(.title3)
                    
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
