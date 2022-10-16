//
//  ParselyModel.swift
//  Parsely
//
//  Created by Colin Dively on 10/14/22.
//

import Foundation

class Parsely: ObservableObject {
	@Published var url: String = ""
	var defaultURL: String = "https://api.github.com/users/hadley/orgs"
	
	
	func containsValidJSON(url: String) async {
		guard let url = URL(string: url) else { print("invalid url"); return }
		guard let data = try? Data(contentsOf: url) else { print("data failed"); return }
		print("passed our first couple guards")
		guard JSONSerialization.isValidJSONObject(data) else { print("invalid json"); return }
	}
}
