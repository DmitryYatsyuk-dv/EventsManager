//
//  AppCoordinator.swift
//  EventsManager
//
//  Created by Lucky on 28.12.2021.
//

import UIKit

protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get }
    func start()
}

final class AppCoordinator: CoordinatorProtocol {

    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        
        childCoordinators.append(eventListCoordinator)
        
        eventListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
