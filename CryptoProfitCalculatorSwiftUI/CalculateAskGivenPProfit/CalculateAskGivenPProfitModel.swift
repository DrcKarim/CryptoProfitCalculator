//
//  CalculateAskGivenPProfitModel.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 25/1/2025.
//

import Foundation

final class CalculateAskGivenPProfitModel: ObservableObject {
    
    
    @Published var amount: String = ""
    @Published var bid: String = ""
    @Published var ask: String = ""
    @Published var profit: String = ""
    @Published var profitPercentage: String = ""
    
    
    func resetFields(){
      amount = ""
      ask = "_"
      bid = ""
      profit = "_"
      profitPercentage = ""
    }
    
    func CalculatePercentageProfit(){
        guard let amountValue = Double(amount),
              let bidValue = Double(bid),
              let profitPercentageValue = Double(profitPercentage)
        else {return}
        
        let askValue = ((profitPercentageValue * bidValue) / 100 ) + bidValue
        let profitValue = (askValue - bidValue) * amountValue
        
        ask = String(format: "%.2f", askValue)
        profit = String(format: "%.2f", profitValue)
    
     }
}
