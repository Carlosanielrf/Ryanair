//
//  Station.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

struct Stations: Decodable {
    var stations: [Station]
}

struct Station: Decodable {
    let code: String
    let name: String
    let countryCode: String
    let countryName: String
}
