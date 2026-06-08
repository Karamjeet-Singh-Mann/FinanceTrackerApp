//
//  EmptyStateView.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 07/06/26.
//

import SwiftUI

struct EmptyStateView: View {
    
    let title: String
    let message: String
    let systemImage: String
    
    var body: some View {
        
        ContentUnavailableView(
            title,
            systemImage: systemImage,
            description: Text(message)
        )
    }
}
#Preview {
    EmptyStateView(title: "No Transactions", message: "You have no transactions yet", systemImage: "book.closed.fill")
}