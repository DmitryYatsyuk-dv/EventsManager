//
//  AddEventCoordinator.swift
//  EventsManager
//
//  Created by Lucky on 07.01.2022.
//

import UIKit

final class AddEventCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let navigationController: UINavigationController
    
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addEventViewController: AddEventViewController = .instantiate()
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self
        addEventViewController.viewModel = addEventViewModel
        navigationController.present(addEventViewController, animated: true, completion: nil)
    }
    
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
    
//    deinit {
//        print("deinit from AddEventCoordinator")
//    }
}
