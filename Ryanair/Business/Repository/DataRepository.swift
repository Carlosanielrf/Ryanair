//
//  DataRepository.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 29/01/2023.
//

import Foundation

protocol DataRepositoryProtocol: AnyObject {
    func get(flightSearch: FlightSearch, completion: @escaping (Result<FlightData, Error>) -> Void)
    func getStations(completion: @escaping (Result<Stations, Error>) -> Void)
}

final class DataRepository: DataRepositoryProtocol {
    
    let searchFlightsService: SearchFlightsService
    let getStationsService: StationsService
    
    init(
        searchFlightsService: SearchFlightsService,
        getStationsService: StationsService
    ) {
        self.searchFlightsService = searchFlightsService
        self.getStationsService = getStationsService
    }
    
    func get(flightSearch: FlightSearch, completion: @escaping (Result<FlightData, Error>) -> Void) {
        searchFlightsService.get(flightSearch: flightSearch, completion: completion)
    }
    
    func getStations(completion: @escaping (Result<Stations, Error>) -> Void) {
        getStationsService.get(completion: completion)
    }
}
