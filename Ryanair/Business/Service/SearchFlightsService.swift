//
//  SearchFlightsService.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Alamofire

protocol SearchFlightsServiceProtocol: AnyObject {
    func get(flightSearch: FlightSearch, completion: @escaping (Result<FlightData, Error>) -> Void)
}

final class SearchFlightsService: BaseService, SearchFlightsServiceProtocol {
    
    private let pathBuilder = PathBuilder()
    private let agreementKey = "AGREED"
    
    func get(
        flightSearch: FlightSearch,
        completion: @escaping (Result<FlightData, Error>) -> Void
    ) {
        guard let url = pathBuilder.getFligts() else {
            return
        }
        
        let parameters = getParameters(from: flightSearch)
        getData(url: url, parameters: parameters, type: FlightData.self) { result in
            completion(result)
        }
    }
}

// MARK: - Parameters

private extension SearchFlightsService {
    
    func getParameters(from flightSearch: FlightSearch, additionalParameters: Parameters = [:]) -> Parameters {
        var params: Parameters = [
            "origin": flightSearch.originCountryCode,
            "destination": flightSearch.destinationCountryCode,
            "dateout": flightSearch.dateOut,
            "adt": flightSearch.adultsNr,
            "teen": flightSearch.teensNr,
            "chd": flightSearch.childNr,
            "ToUs": agreementKey
        ]
        params.merge(additionalParameters) { (_, new) in new }
        return params
    }
}
