//
//  CalculateAskGivenProfit.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 23/12/2024.
//

import SwiftUI


struct CalculateAskGivenProfit: View {
    let title: String
    
    @StateObject private var viewModel = CalcuateAskGivenProfitModel()
    
    
    var body: some View {
        VStack(spacing: 20) {
           
            Text("Calculate Ask Given Profit")
                .font(.largeTitle)
                .padding(.top)
            
             
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Amount USDT:")
                    Spacer()
                    TextField("Enter amount", text: $viewModel.amount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 150)
                 }
                
                HStack {
                    Text("Bid USDT:")
                    Spacer()
                    TextField("Enter bid", text: $viewModel.bid)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 150)
                }
                
                HStack {
                    Text("Profit USDT:")
                    Spacer()
                    TextField("Enter profit", text: $viewModel.profitUSDT)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 150)
                }
            }
            .padding(.horizontal)
            
           
            HStack {
                Button(action: viewModel.resetFields) {
                    Text("Reset")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                Button(action: viewModel.calculateAskGivenProfit) {
                    Text("Calculate")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            
          
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Asking Price:")
                        .font(.headline)
                    Spacer()
                    Text(viewModel.ask)
                        .foregroundColor(viewModel.ask == "-" ? Color.black.opacity(0.3) : Color.green)
                        .font(.headline)
                }
                
                HStack {
                    Text("Profit %:")
                        .font(.headline)
                    Spacer()
                    Text(viewModel.profitPercentage)
                        .foregroundColor(viewModel.profitPercentage == "-" ? Color.black.opacity(0.3) : Color.green)
                        .font(.headline)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Calculate Ask Given Profit")
        .navigationBarTitleDisplayMode(.inline)
    }
    

}


  

struct CalculateAskGivenProfit_Previews: PreviewProvider {
    static var previews: some View {
        CalculateAskGivenProfit(title: "Calculate Ask Given Profit")
    }
}
