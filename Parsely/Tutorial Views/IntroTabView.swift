//
//  IntroTabView.swift
//  Parsely
//
//  Created by Colin Dively on 10/14/22.
//

import SwiftUI
import Foundation

struct IntroTabView: View {
	@StateObject var parsely = Parsely()
	@State var select: Int = 1
    var body: some View {
		TabView(selection: $select) {
			FirstView()
				.tabItem {}
				.tag(1)
			LinkEntryView()
				.tabItem {}
				.tag(2)
			ExitIntroView()
				.tabItem {}
				.tag(3)
		}.environmentObject(parsely)
		.tabViewStyle(PageTabViewStyle())
		.ignoresSafeArea()
    }
}

struct IntroTabView_Previews: PreviewProvider {
    static var previews: some View {
		IntroTabView().environmentObject(Parsely())
    }
}
