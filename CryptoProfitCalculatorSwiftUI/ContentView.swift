//
//  ContentView.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                HStack(spacing: 30) {
                    NavigationLink(destination: CalculateProfit(title: "Calculate Profit"))
                    {
                        
                        
                        VStack(spacing: 10){
                            Image("cap")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.red)
                            Text("Calculate Profit")
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                        
                    }
                    NavigationLink(destination: CalculateAskGivenProfit(title: "Calculate Ask Given Profit"))
                    {
                        VStack(spacing: 10){
                            Image("cag")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.green)
                            Text("Ask Given Profit")
                                .font(.caption)
                                .foregroundColor(.black)
                            
                            
                        }
                    }
                   }
                    HStack(spacing: 30) {
                        NavigationLink(destination: CalculateAskGivenPProfit(title: "Calculate Ask Given % Profit"))
                        {
                            VStack(spacing: 10){
                                Image("cagp")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.blue)
                                Text("Ask Given % Profit")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                        NavigationLink(destination: CalculateNeededAmount(title: "Calculate Needed Amount"))
                        {
                            VStack(spacing: 10){
                                Image("cnat")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.orange)
                                Text("Needed Amount")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Crypto Calculator")
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
 
