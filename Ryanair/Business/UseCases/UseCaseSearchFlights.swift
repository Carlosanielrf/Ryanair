//
//  UseCaseSearchFlights.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

final class UseCaseSearchFlights {
 
    private let dataRepository: DataRepositoryProtocol
    
    init(
        dataRepository: DataRepositoryProtocol
    ) {
        self.dataRepository = dataRepository
    }
    
    func execute(
        flightSearch: FlightSearch,
        completion: @escaping (Result<FlightData, Error>) -> Void
    ) {
        dataRepository.get(flightSearch: flightSearch, completion: completion)
    }
}
