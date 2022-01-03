//
//  AddEventCoordinator.swift
//  EventsManager
//
//  Created by Lucky on 03.01.2022.
//

import UIKit

final class AddEventCoordinator: CoordinatorProtocol {
    
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /*
    Create add eventViewController
    Create add eventViewModel
    Present modally controller using navController
    */
    func start() {
        let addEventViewController: AddEventViewController = .instantiate()
        let addEventViewModel = AddEventViewModel()
        addEventViewController.viewModel = addEventViewModel
        navigationController.present(addEventViewController, animated: true, completion: nil)
    }
    
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        print("Deinit from add event coordinator")
    }
    
    
}
