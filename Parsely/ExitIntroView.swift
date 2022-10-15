//
//  ExitIntroView.swift
//  Parsely
//
//  Created by Colin Dively on 10/14/22.
//

import SwiftUI

struct ExitIntroView: View {
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
			Text("Welcome To Parsely!")
				.padding()
				.font(.headline)
				.foregroundColor(.white)
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
