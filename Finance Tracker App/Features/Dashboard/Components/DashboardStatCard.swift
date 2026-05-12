//
//  DashboardStatCard.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 12/05/26.
//

import SwiftUI

struct DashboardStatCard: View {
    
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        
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
}
