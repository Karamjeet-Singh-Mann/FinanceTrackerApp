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
            
            VStack(spacing: 20) {
                
                Text("Finance Tracker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                NavigationLink {
                    TransactionsView()
                } label: {
                    Text("Go To Transactions")
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Dashboard")
        }
    }
}
