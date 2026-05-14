//
//  AIService.swift
//  Finance Tracker App
//
//  Created by Karamjeet singh on 14/05/26.
//

import Foundation

protocol AIService {
    
    func suggestCategory(
        for title: String
    ) -> String
}
