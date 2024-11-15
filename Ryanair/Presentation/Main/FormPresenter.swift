//
//  FormPresenter.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

final class FormPresenter<T: FormView>: Presenter<T> {
    
    private(set) var originStationSelected: Station?
    private(set) var destinyStationSelected: Station?
    private let dateFormatter: DateFormatterUtils
    
    init(
        dateFormatter: DateFormatterUtils = DateFormatterUtils()
    ) {
        self.dateFormatter = dateFormatter
    }
    
    func originStationSelected(_ station: Station) {
        self.originStationSelected = station
        updateView()
    }
    
    func destinyStationSelected(_ station: Station) {
        self.destinyStationSelected = station
        updateView()
    }
    
    func updateView() {
        let isEnabled = originStationSelected != nil && destinyStationSelected != nil
        baseView?.searchBtnState(isEnabled: isEnabled)
    }
    
    func onSearch(
        dateOut: Date,
        adultsNr: Int,
        teensNr: Int,
        childNr: Int
    ) {
        guard let originStationSelected,
                let destinyStationSelected else { return }
        let date = dateFormatter.getYYYYMMDDFrom(date: dateOut)
        
        let model = FlightSearch(
            originCountryCode: originStationSelected.code,
            destinationCountryCode: destinyStationSelected.code,
            dateOut: date,
            adultsNr: adultsNr,
            teensNr: teensNr,
            childNr: childNr
        )
        
        baseView?.onSearch(flightSearch: model)
    }
}
