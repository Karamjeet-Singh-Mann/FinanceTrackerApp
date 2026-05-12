//
//  RecentTransactionRow.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 12/05/26.
//

import SwiftUI

struct RecentTransactionRow: View {
    
    let transaction: Transaction
    
    var body: some View {
        
        HStack {
            
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                
                Text(transaction.title)
                    .fontWeight(.semibold)
                
                Text(transaction.category)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text("₹\(transaction.amount, specifier: "%.0f")")
                .fontWeight(.bold)
        }
        .padding()
        .background(.background)
        .clipShape(
            RoundedRectangle(cornerRadius: 16)
        )
    }
}
