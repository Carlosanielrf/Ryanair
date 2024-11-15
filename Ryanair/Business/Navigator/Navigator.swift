//
//  Navigator.swift
//  Ryanair
//
//  Created by Carlos Fonseca on 11/11/2024.
//

import UIKit

protocol Navigator: AnyObject {
    func push(viewController: UIViewController, from viewControllerParent: UIViewController, animated: Bool)
    func present(viewController: UIViewController, from viewControllerParent: UIViewController, animated: Bool, completion: (() -> Void)?)
}

class AppNavigator: Navigator {
    
    func push(
        viewController: UIViewController,
        from viewControllerParent: UIViewController,
        animated: Bool
    ) {
        guard let navigationController = viewControllerParent.navigationController
        else { return }
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func present(
        viewController: UIViewController,
        from viewControllerParent: UIViewController,
        animated: Bool, completion: (() -> Void)?
    ) {
        guard let navigationController = viewControllerParent.navigationController
        else { return }
        
        navigationController.present(viewController, animated: animated, completion: completion)
    }
}
