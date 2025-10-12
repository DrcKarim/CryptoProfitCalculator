//
//  InterstitialAd.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by Karim Bouchaane on 11/10/2025.
//
//
 
import SwiftUI
import GoogleMobileAds

final class InterstitialAdManager: NSObject, ObservableObject, FullScreenContentDelegate {
    private var interstitialAd: InterstitialAd? // ✅ New class name (no GAD prefix) ca-app-pub-1332480513983290/7742082001   ca-app-pub-3940256099942544/4411468910
    private let adUnitID = "ca-app-pub-1332480513983290/7742082001" // ✅ Test Ad ID

    override init() {
        super.init()
        loadAd()
    }

    // MARK: - Load the interstitial ad
    func loadAd() {
        let request = Request() // ✅ New request type
        InterstitialAd.load(with: adUnitID, request: request) { [weak self] ad, error in
            if let error = error {
                print("❌ Failed to load interstitial ad: \(error.localizedDescription)")
                return
            }

            self?.interstitialAd = ad
            self?.interstitialAd?.fullScreenContentDelegate = self
            print("✅ Interstitial ad loaded successfully.")
        }
    }
    
    /// ✅ Called when you want to show ad conditionally
        func showIfNeeded(from rootViewController: UIViewController?) {
            if Constants.numberOfClicks == Constants.counterToShow {
                print("🎯 Showing interstitial ad after 3 actions")
                show(from: rootViewController)
                Constants.numberOfClicks = 0
            } else {
                Constants.numberOfClicks += 1
                print("👉 User action count: \(Constants.numberOfClicks)")
            }
        }

    // MARK: - Show ad
    func show(from rootViewController: UIViewController?) {
        guard let ad = interstitialAd else {
            print("⚠️ Ad not ready yet, reloading...")
            loadAd()
            return
        }

        ad.present(from: rootViewController!)
        interstitialAd = nil // clear current ad
        loadAd() // preload next one
    }

    // MARK: - Delegate Callbacks
    func adDidDismissFullScreenContent(_ ad: any FullScreenPresentingAd) {
        print("✅ Interstitial ad dismissed.")
        loadAd()
    }

    func ad(_ ad: any FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: any Error) {
        print("❌ Failed to present interstitial ad: \(error.localizedDescription)")
    }
}
