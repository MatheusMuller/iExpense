//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Matheus Müller on 20/02/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}
