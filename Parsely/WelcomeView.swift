//
//  WelcomeView.swift
//  Parsely
//
//  Created by Colin Dively on 10/14/22.
//

import SwiftUI
import UIKit
import WebKit

struct WelcomeView: View {
	@EnvironmentObject var parsely: Parsely
	@State private var scaleAmt = 1.0
	@State private var tutorialURL: String = ""
	@State private var textError: Bool = false
	var body: some View {
		VStack {
			Image(systemName: "leaf.circle.fill")
				.resizable()
				.frame(width: 50, height: 50)
				.aspectRatio(contentMode: .fit)
				.scaleEffect(scaleAmt)
				.foregroundColor(.green)
				.animation(
					.easeInOut(duration: 1.0)
					.repeatForever(autoreverses: true),
					value: scaleAmt)
			Text("Enter a URL")
				.padding()
				.font(.headline)
				.foregroundColor(.white)
			TextField("https://", text: $tutorialURL)
				.textCase(.lowercase)
				.textFieldStyle(.roundedBorder)
				.frame(width: 200.0)
				.onSubmit {
					let urlString = "https://\(tutorialURL)"
					guard urlString.isValidURL() else {
						textError = true
						print("failed")
						return
					}
					print("success")
					parsely.url = urlString
					print(parsely.url)
				}
		}
		.onAppear { scaleAmt += 0.2 }
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.blue)
	}
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
		WelcomeView().environmentObject(Parsely())
    }
}

extension String {
	func isValidURL() -> Bool {
		guard let url = URL(string: self) else { return false }
		if UIApplication.shared.canOpenURL(url) { return true }
		else { return false }
	}
}
// if you link your app on or after iOS 9.0, you must declare the URL schemes you pass to this method by adding
// the LSApplicationQueriesSchemes key to your app's Info.plist file. This method always returns false for
// undeclared schemes, even if the device doesn’t have a registered app installed.
