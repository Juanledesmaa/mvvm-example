//
//  MainRouter.swift
//  employees
//
//  Created by juan ledesma on 20/11/20.
//

import Foundation
import UIKit

final class MainRouter {
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    private func setRootViewController(viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    func presentMainViewController() {
        let viewModel = EmployeesViewModel()
        let viewController = EmployeesViewController(viewModel: viewModel)
        setRootViewController(viewController: viewController)
    }

}
