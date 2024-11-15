//
//  UseCasesAssembly.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Swinject

final class UseCasesAssembly: Assembly {
    
    func assemble(
        container: Container
    ) {
        container.register(UseCaseGetStations.self) { resolver in
            UseCaseGetStations(dataRepository: resolver.resolve(DataRepositoryProtocol.self)!)
        }
        container.register(UseCaseSearchFlights.self) { resolver in
            UseCaseSearchFlights(dataRepository: resolver.resolve(DataRepositoryProtocol.self)!)
        }
    }
}
