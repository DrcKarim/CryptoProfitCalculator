//
//  CalculateNeededAmount.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 23/12/2024.
// CalculateNeededAmount
 
import SwiftUI

struct CalculateNeededAmount: View {
    let title: String
    
    @StateObject private var viewModel = CalculateNeededAmountModel()
    
    var body: some View {
        VStack {
                Text(title)
                        .font(.largeTitle)
                        .padding()
            
            VStack {
                HStack{
                   Text("Bid USDT: ")
                    Spacer()
                    TextField("Enter bid", text:  $viewModel.bid)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 150)
                  }
                HStack{
                   Text("Ask USDT: ")
                    Spacer()
                    TextField("Enter ask", text:  $viewModel.ask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 150)
                  }
                HStack{
                   Text("Profit USDT: ")
                    Spacer()
                    TextField("Enter profit", text:  $viewModel.profit)
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
                Button(action: viewModel.calculateNeededAmount){
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
                Text("Amount USDT: ")
                     .font(.headline)
                Spacer()
                 Text(viewModel.amount)
                     .foregroundColor(viewModel.amount == "-" ? Color.black.opacity(0.3) : Color.green)
                     .font(.headline)
                
               }
             HStack() {
                Text("Profit %: ")
                     .font(.headline)
                Spacer()
                 Text(viewModel.profitpourcentage)
                     .foregroundColor(viewModel.profitpourcentage == "-" ? Color.black.opacity(0.3) : Color.green)
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
    }
    
 
    
    
}

struct CalculateNeededAmount_Previews: PreviewProvider {
    static var previews: some View {
        CalculateNeededAmount(title: "Calculate Needed Amount")
    }
}
 
