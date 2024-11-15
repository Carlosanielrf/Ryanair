//
//  AppCoordinator.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import UIKit
import Swinject
import SwinjectStoryboard

protocol Coordinator: AnyObject {
    func start()
}

class AppCoordinator: Coordinator {
    private let window: UIWindow
    private let container: Container
    
    private lazy var storyboard = {
        SwinjectStoryboard.create(name: "Main", bundle: nil, container: container)
    }()
    
    init(
        window: UIWindow,
        container: Container
    ) {
        self.window = window
        self.container = container
    }
    
    func start() {
        if let viewController = storyboard.instantiateViewController(withIdentifier: "FormViewController") as? FormViewController {
            let navigationController = UINavigationController(rootViewController: viewController)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
}
