//
//  CalculateProfitModel.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 25/1/2025.
//

import Foundation

final class CalculateProfitModel: ObservableObject {
    @Published var amount: String = ""
    @Published var bid: String = ""
    @Published var ask: String = ""
    @Published var profitUSDT: String = "-"
    @Published var profitPercentage: String = "-"
    @Published var profitMade: String = "-"
    @Published var profitMadePercentage: String = "-"
    
    
    
      func resetFields() {
            amount = ""
            bid = ""
            ask = ""
            profitUSDT = "-"
            profitPercentage = "-"
            profitMade = "-"
            profitMadePercentage = "-"
        }

      
      func calculateProfit() {
            guard let amountValue = Double(amount),
                  let bidValue = Double(bid),
                  let askValue = Double(ask) else {
                return
               }

            let profitUSDTValue = (askValue - bidValue) * amountValue
            let profitPercentageValue = (askValue - bidValue) / bidValue * 100
            let profitMadeValue = profitUSDTValue
            let profitMadePercentageValue = profitPercentageValue

            profitUSDT = String(format: "%.2f", profitUSDTValue)
            profitPercentage = String(format: "%.2f", profitPercentageValue) + "%"
            profitMade = String(format: "%.2f", profitMadeValue)
            profitMadePercentage = String(format: "%.2f", profitMadePercentageValue) + "%"
        }
    
}
