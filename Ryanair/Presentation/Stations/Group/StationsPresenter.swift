//
//  StationsPresenter.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

final class StationsPresenter<T: StationsView>: Presenter<T> {
    
    private let useCase: UseCaseGetStations
    
    init(
        useCase: UseCaseGetStations
    ) {
        self.useCase = useCase
    }
    
    func load() {
        useCase.execute { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                self.handleSuccess(response)
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
}

// MARK: - Private Methods

private extension StationsPresenter {
    
    func handleSuccess(
        _ stations: Stations
    ) {
        baseView?.setDataSource(stations.stations)
    }
    
    func handleError(_ error: Error) {
        print(error)
    }
}
