//
//  SearchMapper.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

final class SearchMapper: SearchMapperProtocol {
    
    let dateFormatter: DateFormatterUtils
    
    init(
        dateFormatter: DateFormatterUtils
    ) {
        self.dateFormatter = dateFormatter
    }
    
    func getSearchModelList(
        flightData: FlightData
    ) -> [SearchModel] {
        
        guard
            let trips = flightData.trips,
            let origin = trips.first?.origin,
            let destination = trips.first?.destination
        else { return [] }
        
        // Collect all flights from all trip dates
        let allFlights = trips
            .flatMap { $0.dates ?? [] }
            .flatMap { $0.flights ?? [] }
        
        // Map flights to SearchModel, filtering out nil values
        return allFlights.compactMap { flight in
            guard
                let flightTime = flight.time,
                let hourTimes = getHourTimes(from: flightTime),
                let fares = flight.regularFare?.fares,
                let price = getPriceFrom(
                    regularFare: fares,
                    currency: flightData.currency
                ),
                let duration = flight.duration
            else {
                return nil
            }
            
            return SearchModel(
                origin: origin,
                destination: destination,
                departureTime: hourTimes.departureTime,
                arriveTime: hourTimes.arrivalTime,
                duration: duration,
                price: price
            )
        }
    }
    
    // MARK: - Private methods
    
    private func getPriceFrom(
        regularFare: [FareElement],
        currency: String?
    ) -> String? {
        if let price = regularFare.first?.amount,
            let currency {
            return [String(price),currency].joined()
        }
        
        return nil
    }
    
    private func getHourTimes(from times: [String]) -> (departureTime: String, arrivalTime: String)? {
        if let rawDepartureTime = times.first,
           let rawArrivalTime = times.last {
            let departureTime = dateFormatter.getHHMMFrom(
             value: rawDepartureTime
            )
            let arrivalTime = dateFormatter.getHHMMFrom(
             value: rawArrivalTime
            )
            
            return (departureTime.description, arrivalTime.description)
        }
        
        return nil
    }
}
