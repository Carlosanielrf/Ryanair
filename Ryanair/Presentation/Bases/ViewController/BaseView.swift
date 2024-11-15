//
//  BaseView.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

protocol BaseView {
   
   func getPresenter() throws -> BasePresenter
}
