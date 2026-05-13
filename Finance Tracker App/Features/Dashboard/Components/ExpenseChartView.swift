//
//  ExpenseChartView.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 13/05/26.
//

import SwiftUI
import Charts

struct ExpenseChartView: View {
    
    let data: [CategoryExpense]
    
    var body: some View {
        
        VStack(
            alignment: .leading,
            spacing: 16
        ) {
            
            Text("Spending Analytics")
                .font(.title2.bold())
            
            if data.isEmpty {
                
                ContentUnavailableView(
                    "No Analytics Available",
                    systemImage: "chart.bar"
                )
                
            } else {
                
                Chart(data) { item in
                    
                    BarMark(
                        x: .value(
                            "Category",
                            item.category
                        ),
                        y: .value(
                            "Amount",
                            item.total
                        )
                    )
                    .cornerRadius(8)
                }
                .frame(height: 250)
            }
        }
    }
}
