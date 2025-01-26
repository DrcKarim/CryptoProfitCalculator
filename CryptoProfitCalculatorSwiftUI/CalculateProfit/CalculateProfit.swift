//
//  CalculateProfit.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 23/12/2024.
// 

import SwiftUI

struct CalculateProfit: View {
    
    @StateObject private var viewModel = CalculateProfitModel()
    
    let title: String
    

    var body: some View {
            VStack(spacing: 20) {
                
                Text("Calculate Profit")
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
                        Text("Ask USDT:")
                        Spacer()
                        TextField("Enter ask", text: $viewModel.ask)
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
                    Button(action: viewModel.calculateProfit) {
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
                        VStack(alignment: .leading) {
                            Text("Profit USDT: ")
                                .font(.headline)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                     
                            Text(viewModel.profitMade)
                                .foregroundColor(viewModel.profitMade == "-" ? Color.black.opacity(0.3) : Color.green)
                                    .font(.headline)
                           
                        }
                    }

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Profit %: ")
                                .font(.headline)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                       
                            Text(viewModel.profitMadePercentage)
                                .foregroundColor(viewModel.profitMadePercentage == "-" ? Color.black.opacity(0.3) : Color.green)
                                    .font(.headline)
                        }
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("Calculate Profit")
            .navigationBarTitleDisplayMode(.inline)
        }
    
}
 

struct CalculateProfit_Previews: PreviewProvider {
    static var previews: some View {
        CalculateProfit(title: "Calculate Profit")
    }
}
