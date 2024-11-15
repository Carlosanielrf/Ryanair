//
//  Container.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Swinject

final class ServiceAssembly: Assembly {
    
    func assemble(
        container: Container
    ) {
        container.register(StationsService.self) { _ in
            StationsService()
        }
        container.register(SearchFlightsService.self) { _ in
            SearchFlightsService()
        }
    }
}
