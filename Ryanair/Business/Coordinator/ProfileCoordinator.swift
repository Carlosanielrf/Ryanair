//
//  ProfileCoordinator.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import UIKit
import SwinjectStoryboard
import Swinject

class ProfileCoordinator {
    
    private let navigator: Navigator
    private let container: Container
    
    private lazy var storyboard = {
        SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
    }()
    
    init(
        navigator: Navigator,
        container: Container
    ) {
        self.navigator = navigator
        self.container = container
    }
    
    func showSearch(
        from viewController: UIViewController,
        flightSearch: FlightSearch
    ) {
        if let searchViewController = storyboard.instantiateViewController(
            withIdentifier: "SearchViewController"
        ) as? SearchViewController {
            searchViewController.configure(flightSearch: flightSearch)
            navigator.push(
                viewController: searchViewController,
                from: viewController,
                animated: true
            )
        }
    }
    
    func showStations(
        from viewController: UIViewController,
        stationType: StationSelectionType,
        delegate: StationsViewControllerDelegate
    ) {
        if let stationsViewController = storyboard.instantiateViewController(
            withIdentifier: "StationsViewController"
        ) as? StationsViewController {
            stationsViewController.configure(
                stationSelectionType: stationType,
                delegate: delegate
            )
            navigator.push(
                viewController: stationsViewController,
                from: viewController,
                animated: true
            )
        }
    }
}
