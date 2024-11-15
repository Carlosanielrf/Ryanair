//
//  ServiceTest.swift
//  RyanairTests
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import XCTest
@testable import Ryanair

class SearchFlightsServiceTests: XCTestCase {
    
    private var service: SearchFlightsServiceProtocol?
    
    override func setUp() {
        super.setUp()
        
        service = SearchFlightsService()
    }
    
    func test_getCompanyInfo() {
        // Arrange
        let expectation = XCTestExpectation(description: #function)
        let flightSearch = FlightSearch(
            originCountryCode: "DUB",
            destinationCountryCode: "STN",
            dateOut: "2023-12-23",
            adultsNr: 2,
            teensNr: 0,
            childNr: 0
        )
        
        // Act
        service?.get(flights: flightSearch, completion: { trips in
            expectation.fulfill()
            
            // Assert
            XCTAssertEqual(trips?.trips.first?.origin, "DUB")
        })
        
        wait(for: [expectation], timeout: 3.0)
    }
}
