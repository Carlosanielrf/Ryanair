//
//  UseCaseGetStations.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

final class UseCaseGetStations {
    
    private let dataRepository: DataRepositoryProtocol
    
    init(
        dataRepository: DataRepositoryProtocol
    ) {
        self.dataRepository = dataRepository
    }
    
    func execute(
        completion: @escaping (Result<Stations, Error>) -> Void
    ) {
        dataRepository.getStations(completion: completion)
    }
}
