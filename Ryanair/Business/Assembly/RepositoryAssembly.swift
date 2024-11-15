//
//  RepositoryAssembly.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Swinject

final class RepositoryAssembly: Assembly {
    
    func assemble(
        container: Container
    ) {
        container.register(DataRepositoryProtocol.self) { resolver in
            DataRepository(
                searchFlightsService: resolver.resolve(SearchFlightsService.self)!,
                getStationsService: resolver.resolve(StationsService.self)!
            )
        }
    }
}
