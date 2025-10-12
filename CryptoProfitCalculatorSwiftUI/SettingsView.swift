//
//  SettingsView.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by Karim Bouchaane on 11/10/2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.scenePhase) private var scenePhase
    @State private var showLanguageSheet = false
    @State private var showRestartAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Setting")
                .font(.title2)
                .bold()
                .padding(.top, 30)
            
            // 🔹 Change Language
            Button(action: {
                showLanguageSheet = true
            }) {
                Text("Change Language")
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .confirmationDialog("Select Language", isPresented: $showLanguageSheet, titleVisibility: .visible) {
                Button("English") { changeLanguage(to: "en") }
                Button("French") { changeLanguage(to: "fr") }
                Button("Cancel", role: .cancel) { }
            }
            
            // 🔹 Share App
            Button(action: shareApp) {
                Text("Share App")
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            // 🔹 Rate App
            Button(action: rateApp) {
                Text("Rate App")
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .navigationTitle("Settings")
        .alert("Language Changed",
               isPresented: $showRestartAlert,
               actions: {
                   Button("OK") { exit(0) }
                   Button("Cancel", role: .cancel) { }
               },
               message: {
                   Text("The app will exit and relaunch to apply the new language.")
               })
    }
}

extension SettingsView {
    
    // ✅ Change language
    func changeLanguage(to code: String) {
        UserDefaults.standard.set([code], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        showRestartAlert = true
    }
    
    // ✅ Share app
    func shareApp() {
        guard !ProcessInfo.processInfo.environment.keys.contains("XCODE_RUNNING_FOR_PREVIEWS") else { return }

        guard let url = URL(string: "https://apps.apple.com/us/app/crypto-profit-calculator-app/id6475302492") else { return }
        let text = "Check out this awesome app!"
        let activityVC = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)
        
        // Present using UIKit bridge
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = scene.windows.first?.rootViewController {
            rootVC.present(activityVC, animated: true)
        }
    }
    
    // ✅ Rate app
    func rateApp() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
