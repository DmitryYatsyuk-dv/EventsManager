//
//  AddEventViewModel.swift
//  EventsManager
//
//  Created by Lucky on 03.01.2022.
//

import UIKit

final class AddEventViewModel {
    //MARK: - Properties
    var coordinator: AddEventCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
}
