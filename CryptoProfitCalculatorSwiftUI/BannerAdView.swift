//
//  Untitled.swift
//  CryptoProfitCalculatorSwiftUI
//
//  Created by Karim Bouchaane on 11/10/2025.
//
import SwiftUI
import GoogleMobileAds

struct BannerAdView: UIViewRepresentable {
    let adUnitID: String

    func makeUIView(context: Context) -> BannerView {
        let banner = BannerView(adSize: AdSizeBanner)
        banner.adUnitID = adUnitID
        banner.rootViewController = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.windows.first?.rootViewController }
            .first
        banner.load(Request())
        return banner
    }

    func updateUIView(_ uiView: BannerView, context: Context) {}
}
