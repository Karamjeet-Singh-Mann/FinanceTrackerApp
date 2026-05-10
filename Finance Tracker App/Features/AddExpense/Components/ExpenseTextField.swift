//
//  ExpenseTextField.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 10/05/26.
//

import SwiftUI

struct ExpenseTextField: View {
    
    let title: String
    @Binding var text: String
    
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text(title)
                .font(.headline)
            
            TextField(title, text: $text)
                .keyboardType(keyboardType)
                .padding()
                .background(
                    Color.gray.opacity(0.1)
                )
                .cornerRadius(12)
        }
    }
}

#Preview {
    ExpenseTextField(title: "", text: .constant(""))
}
