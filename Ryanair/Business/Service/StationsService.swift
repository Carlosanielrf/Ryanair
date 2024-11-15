//
//  GetStationsService.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

protocol StationsServiceProtocol: AnyObject {
    func get(completion: @escaping (Result<Stations, Error>) -> Void)
}

final class StationsService: BaseService,
                             StationsServiceProtocol {
    
    private let pathBuilder: PathBuilder
    
    override init() {
        self.pathBuilder = PathBuilder()
    }
    
    func get(
        completion: @escaping (Result<Stations, Error>) -> Void
    ) {
        let url = pathBuilder.getStations()
        getData(
            url: url,
            parameters: nil,
            type: Stations.self
        ) { result in
            completion(result)
        }
    }
}
