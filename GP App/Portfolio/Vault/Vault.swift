//
//  Vault.swift
//  GP App
//
//  Created by Dave Van Cauwenberghe on 30/07/2023.
//

import Foundation
struct Vault {
    var image: String = ""
    var name: String = ""
    var information: String = "" // Add this property to hold the additional information

    init(image: String, name: String, information: String) {
        self.image = image
        self.name = name
        self.information = information
    }
}
