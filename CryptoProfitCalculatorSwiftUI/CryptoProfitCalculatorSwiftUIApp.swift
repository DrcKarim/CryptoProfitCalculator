//
//  CryptoProfitCalculatorSwiftUIApp.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by macbook on 23/12/2024.
//

import SwiftUI
import GoogleMobileAds
import FirebaseAnalytics
import FirebaseCore

@main
struct CryptoProfitCalculatorSwiftUIApp: App {
    init() {
          // Initialize Google Mobile Ads SDK
          MobileAds.shared.start(completionHandler: nil)
        
          FirebaseApp.configure()
      }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
