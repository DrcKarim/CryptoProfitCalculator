//
//  CalculateNeededAmountModel.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 25/1/2025.
//

import Foundation

final class CalculateNeededAmountModel: ObservableObject {
    @Published var amount: String = ""
    @Published var bid: String = ""
    @Published var ask: String = ""
    @Published var profit: String = ""
    @Published var profitpourcentage = ""
    
     func resetFields(){
        amount = "_"
        ask = ""
        bid = ""
        profit = ""
        profitpourcentage = "_"
    }
    
     func calculateNeededAmount(){
        guard let profitValue = Double(profit),
              let bidValue = Double(bid),
              let askValue = Double(ask)
        else {return}
        
        let amountValue = profitValue / (askValue - bidValue)
        let profitPeurcentage = (askValue - bidValue) / bidValue * 100
        
        amount = String(format: "%.2f", amountValue)
        profitpourcentage = String(format: "%.2f", profitPeurcentage)
        
    }
}
