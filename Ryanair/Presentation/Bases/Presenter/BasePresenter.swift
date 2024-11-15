//
//  BasePresenter.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

protocol BasePresenter: AnyObject {

   func attachView(_ view: BaseView)
   func detachView()
}

