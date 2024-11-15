//
//  SearchPresenter.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import UIKit

final class SearchPresenter<T: SearchView>: Presenter<T> {
    
    private let searchMapper: SearchMapperProtocol
    private let useCase: UseCaseSearchFlights
    
    init(
        useCase: UseCaseSearchFlights,
        searchMapper: SearchMapperProtocol
    ) {
        self.useCase = useCase
        self.searchMapper = searchMapper
    }
    
    func load(
        flightSearch: FlightSearch
    ) {
        useCase.execute(flightSearch: flightSearch) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let trips):
                self.handleSuccess(with: trips)
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
}

// MARK: - Private Methods

private extension SearchPresenter {
    
    func handleSuccess(
        with trips: FlightData
    ) {
        let formattedTrips = searchMapper.getSearchModelList(flightData: trips)
        baseView?.setDataSource(formattedTrips)
    }
    
    func handleError(_ error: Error) {
        print(error)
    }
}
