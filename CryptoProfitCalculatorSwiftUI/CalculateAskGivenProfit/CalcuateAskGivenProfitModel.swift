//
//  CalcuateAskGivenPProfitModel.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 25/1/2025.
//

import Foundation

final class CalcuateAskGivenProfitModel: ObservableObject {
    
    @Published var amount: String = ""
    @Published var bid: String = ""
    @Published var profitUSDT: String = ""
    @Published var ask: String = "-"
    @Published var profitPercentage: String = "-"
    
   
    func resetFields() {
        amount = ""
        bid = ""
        profitUSDT = ""
        ask = "-"
        profitPercentage = "-"
    }
    
   
     func calculateAskGivenProfit() {
        guard let amountValue = Double(amount),
              let bidValue = Double(bid),
              let profitValue = Double(profitUSDT) else {
            return
        }
        
        let askValue = (profitValue / amountValue) + bidValue
        let profitPercentageValue = (profitValue / (bidValue * amountValue)) * 100
        
        ask = String(format: "%.2f", askValue)
        profitPercentage = String(format: "%.2f", profitPercentageValue) + "%"
    }
}
