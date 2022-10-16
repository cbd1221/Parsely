//
//  ExitIntroView.swift
//  Parsely
//
//  Created by Colin Dively on 10/14/22.
//

import SwiftUI

struct ExitIntroView: View {
	@EnvironmentObject var parsely: Parsely
	@State var scaleAmt = 1.0
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
			Text("You Entered: \(parsely.url)")
				.padding()
				.font(.headline)
				.foregroundColor(.white)
			Text("Now that you've picked a sprig, we need to figure out what it looks like")
				.multilineTextAlignment(.center)
				.frame(width: 300)
				.foregroundColor(.white)
				.font(.body)
				.padding()
			Text("We need to confirm it contains valid data to format")
				.multilineTextAlignment(.center)
				.frame(width: 300)
				.foregroundColor(.white)
				.font(.body)
				.padding()
			Text("And then we need to define the data structure")
				.multilineTextAlignment(.center)
				.frame(width: 300)
				.foregroundColor(.white)
				.font(.body)
		}
		.onAppear { scaleAmt += 0.2 }
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.blue)
	}
}

struct ExitIntroView_Previews: PreviewProvider {
    static var previews: some View {
		ExitIntroView().environmentObject(Parsely())
    }
}
