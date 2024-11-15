//
//  SearchMapperProtocol.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

protocol SearchMapperProtocol: AnyObject {
    
    func getSearchModelList(flightData: FlightData) -> [SearchModel]
}
