//
//  CalculateProfit.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 23/12/2024.
//

import SwiftUI
import GoogleMobileAds

struct CalculateProfit: View {
    @StateObject private var viewModel = CalculateProfitModel()
    let title: String
    
    var body: some View {
        VStack(spacing: 20) {
            
            // MARK: - Title
            Text("Calculate Profit")
                .font(.largeTitle)
                .padding(.top)
            
            // MARK: - Input Fields
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
            
            // MARK: - Action Buttons
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
            
            // MARK: - Results
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Profit USDT:")
                        .font(.headline)
                    Spacer()
                    Text(viewModel.profitMade)
                        .foregroundColor(viewModel.profitMade == "-" ? .gray.opacity(0.5) : .green)
                        .font(.headline)
                }

                HStack {
                    Text("Profit %:")
                        .font(.headline)
                    Spacer()
                    Text(viewModel.profitMadePercentage)
                        .foregroundColor(viewModel.profitMadePercentage == "-" ? .gray.opacity(0.5) : .green)
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

