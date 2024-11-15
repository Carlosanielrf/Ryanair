//
//  ProfileCoordinator.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Swinject

class ProfileCoordinatorAssembly: Assembly {
    
    func assemble(
        container: Container
    ) {
        container.register(Navigator.self) { resolver in
            AppNavigator()
        }
        container.register(ProfileCoordinator.self) { resolver in
            ProfileCoordinator(navigator: resolver.resolve(Navigator.self)!, container: container)
        }
    }
}
