//
//  StationsView.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

protocol StationsView: BaseView {
    
    func setDataSource(_ stations: [Station])
}
