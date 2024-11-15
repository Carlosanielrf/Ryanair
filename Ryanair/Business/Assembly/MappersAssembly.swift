//
//  MappersAssembly.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Swinject

final class MappersAssembly: Assembly {
    
    func assemble(
        container: Container
    ) {
        container.register(SearchMapper.self) { resolver in
            SearchMapper(dateFormatter: DateFormatterUtils())
        }
    }
}
