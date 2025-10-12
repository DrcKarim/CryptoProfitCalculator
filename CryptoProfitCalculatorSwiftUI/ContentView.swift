//
//  ContentView.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 23/12/2024.
//

import SwiftUI
import GoogleMobileAds

struct ContentView: View {
    @StateObject private var interstitial = InterstitialAdManager()  // ✅ Interstitial manager

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()

                // 🔹 Main content
                VStack(spacing: 60) {
                    HStack(spacing: 60) {
                        NavigationLink(destination: CalculateProfit(title: "Calculate Profit")
                            .onAppear { showInterstitial() }) {  // ✅ Show interstitial after 3 actions
                            VStack(spacing: 10) {
                                Image("cap")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                Text("Calculate Profit")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }

                        NavigationLink(destination: CalculateAskGivenProfit(title: "Calculate Ask Given Profit")
                            .onAppear { showInterstitial() }) {
                            VStack(spacing: 10) {
                                Image("cag")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                Text("Ask Given Profit")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }

                    HStack(spacing: 60) {
                        NavigationLink(destination: CalculateAskGivenPProfit(title: "Calculate Ask Given % Profit")
                            .onAppear { showInterstitial() }) {
                            VStack(spacing: 10) {
                                Image("cagp")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                Text("Ask Given % Profit")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }

                        NavigationLink(destination: CalculateNeededAmount(title: "Calculate Needed Amount")
                            .onAppear { showInterstitial() }) {
                            VStack(spacing: 10) {
                                Image("cnat")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                Text("Needed Amount")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Crypto Calculator")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        // ⚙️ Gear icon button
                        NavigationLink(destination: SettingsView()
                            .onAppear { showInterstitial() }) {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                    }
                }

                // 🔹 Spacer pushes the banner to the bottom
                Spacer()

                // 🔹 Banner Ad
                BannerAdView(adUnitID: "ca-app-pub-3940256099942544/2934735716")
                    .frame(width: 320, height: 50)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }

    // ✅ Function to show interstitial after 3 actions
    private func showInterstitial() {
        if let root = UIApplication.shared.connectedScenes
            .compactMap({ ($0 as? UIWindowScene)?.windows.first?.rootViewController })
            .first {
            interstitial.showIfNeeded(from: root)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
