//
//  Trips.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

// Root level struct
struct FlightData: Codable {
    let termsOfUse: String?
    let currency: String?
    let currPrecision: Int?
    let routeGroup: String?
    let tripType: String?
    let upgradeType: String?
    let trips: [Trip]?
    let serverTimeUTC: String?
}

// Trip struct
struct Trip: Codable {
    let origin: String?
    let originName: String?
    let destination: String?
    let destinationName: String?
    let routeGroup: String?
    let tripType: String?
    let upgradeType: String?
    let dates: [TripDate]?
}

// TripDate struct
struct TripDate: Codable {
    let dateOut: String?
    let flights: [Flight]?
}

// Flight struct (currently empty as per provided JSON)
struct Flight: Codable {
    let time: [String]?
    let regularFare: Fare?
    let duration: String?
}

struct Fare: Codable {
    let fares: [FareElement]?
}

struct FareElement: Codable {
    let amount: Double?
    let type: String?
}
