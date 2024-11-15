//
//  FormView.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

protocol FormView: BaseView {
    func searchBtnState(isEnabled: Bool)
    func onSearch(flightSearch: FlightSearch)
}
