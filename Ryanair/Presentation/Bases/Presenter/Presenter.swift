//
//  BasePresenter.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

class Presenter<T: BaseView>: BasePresenter {
    
    private(set) public var baseView: T?
    
    public init() {}
    
    func attachView(_ view: BaseView) {
        baseView = view as? T
    }
    
    func detachView() {
        baseView = nil
    }
}
