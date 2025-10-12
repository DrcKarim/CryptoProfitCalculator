//
//  CalculateAskGivenPProfit.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 23/12/2024.
// CalculateAskGivenPProfit

import SwiftUI

struct CalculateAskGivenPProfit: View {
    let title: String

    @StateObject private var viewModel = CalculateAskGivenPProfitModel()
    
    var body: some View {
        VStack(spacing: 20) {
                Text(title)
                        .font(.largeTitle)
                        .padding(.top)
                
             
            VStack(alignment: .leading, spacing: 10) {
             HStack() {
                Text("Amount USDT: ")
                Spacer()
                 TextField("Enter Amount", text: $viewModel.amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150)
               }
             HStack() {
                Text("Bid USDT: ")
                Spacer()
                 TextField("Enter bid", text: $viewModel.bid)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150)
                
               }
             HStack() {
                Text("Profit %: ")
                Spacer()
                 TextField("Enter %", text: $viewModel.profitPercentage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150)
                
               }
          }
           .padding(.horizontal)
         
             
            HStack(){
                Button(action: viewModel.resetFields){
                    Text("Reset")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                Button(action: viewModel.CalculatePercentageProfit){
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
             HStack() {
                Text("Asking Price: ")
                     .font(.headline)
                Spacer()
                 Text(viewModel.ask)
                     .foregroundColor(viewModel.ask == "-" ? Color.black.opacity(0.3) : Color.green)
                     .font(.headline)
                
               }
             HStack() {
                Text("Profit USDT: ")
                     .font(.headline)
                Spacer()
                 Text(viewModel.profit)
                     .foregroundColor(viewModel.profit == "-" ? Color.black.opacity(0.3) : Color.green)
                     .font(.headline)
                
               }
            
           }
           .padding(.horizontal)
           Spacer()
            // MARK: - Banner Ad
            // ca-app-pub-1332480513983290/1898782285  ca-app-pub-3940256099942544/2934735716
            BannerAdView(adUnitID: "cca-app-pub-1332480513983290/1898782285")
                .frame(width: 320, height: 50)
                .padding(.bottom, 10)
            
            
        }
                .navigationTitle(title)  
                .navigationBarTitleDisplayMode(.inline)
                .padding()
                
       }
    
    
}

 

struct CalculateAskGivenPProfit_Previews: PreviewProvider {
    static var previews: some View {
        CalculateAskGivenPProfit(title: "Calculate Ask Given % Profit")
    }
}
 
