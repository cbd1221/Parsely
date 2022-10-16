//
//  TestURLView.swift
//  Parsely
//
//  Created by Colin Dively on 10/16/22.
//

import SwiftUI

struct TestURLView: View {
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
			Text("Validate Parsely URL")
				.padding()
				.font(.headline)
				.foregroundColor(.white)
			
			Button("Validate Default URL") {
				Task {
					await parsely.containsValidJSON(url: parsely.defaultURL)
				}
			}.buttonStyle(.borderedProminent)
				.border(.white, width: 2.0)
				.cornerRadius(10.0)
		}
		.onAppear { scaleAmt += 0.2 }
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.blue)
	}
}

struct TestURLView_Previews: PreviewProvider {
    static var previews: some View {
        TestURLView()
    }
}
