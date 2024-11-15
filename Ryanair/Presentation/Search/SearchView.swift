//
//  SearchView.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import Foundation

protocol SearchView: BaseView {
    func setDataSource(_ dataSource: [SearchModel])
}
