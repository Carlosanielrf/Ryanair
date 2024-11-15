//
//  SearchModel.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

struct SearchModel: Decodable {
    var origin: String
    var destination: String
    var departureTime: String
    var arriveTime: String
    var duration: String
    var price: String
}
