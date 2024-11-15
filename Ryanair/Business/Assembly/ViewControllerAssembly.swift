//
//  ViewControllerAssembly.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Swinject
import SwinjectStoryboard
import UIKit

final class ViewControllerAssembly: Assembly {
    
    func assemble(
        container: Container
    ) {
        
        // MARK: - SearchViewController
        container.register(SearchPresenter<SearchViewController>.self) { resolver in
            SearchPresenter(
                useCase: resolver.resolve(UseCaseSearchFlights.self)!,
                searchMapper: resolver.resolve(SearchMapper.self)!
            )
        }
        container.storyboardInitCompleted(SearchViewController.self) { resolver, viewController in
            viewController.coordinator = resolver.resolve(ProfileCoordinator.self)
            viewController.presenter = resolver.resolve(SearchPresenter<SearchViewController>.self)
        }
        
        // MARK: - FormViewController
        container.register(FormPresenter<FormViewController>.self) { _ in
            FormPresenter()
        }
        container.storyboardInitCompleted(FormViewController.self) { resolver, viewController in
            viewController.coordinator = resolver.resolve(ProfileCoordinator.self)
            viewController.presenter = resolver.resolve(FormPresenter<FormViewController>.self)
        }
        
        // MARK: - StationsViewController
        container.register(StationsPresenter<StationsViewController>.self) { resolver in
            StationsPresenter(useCase: resolver.resolve(UseCaseGetStations.self)!)
        }
        container.storyboardInitCompleted(StationsViewController.self) { resolver, viewController in
            viewController.coordinator = resolver.resolve(ProfileCoordinator.self)
            viewController.presenter = resolver.resolve(StationsPresenter<StationsViewController>.self)
        }
        
        // MARK: - Station cell
        
        container.register(StationCell.self) { resolver in
            StationCell()
        }
    }
}
