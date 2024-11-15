//
//  PathBuilder.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

class PathBuilder {
    
    private let baseUrl = "https://nativeapps.ryanair.com/api"
    private let baseUrl2 = "https://mobile-testassets-dev.s3.eu-west-1.amazonaws.com"
    private let v4 = "v4"
    
    // Base
    private let slash = "/"
    
    // Availability
    private let availability = "availability"
    
    // Origin
    private let origin = "origin"
    
    // Stations
    private let stations = "stations.json"
    
    func getFligts() -> String? {
        
        return [baseUrl, v4, availability].joined(separator: slash)
    }
    
    func getStations() -> String {
        
        return [baseUrl2, stations].joined(separator: slash)
    }
}

