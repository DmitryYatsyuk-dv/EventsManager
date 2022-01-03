//
//  EventListViewModel.swift
//  EventsManager
//
//  Created by Lucky on 03.01.2022.
//

import Foundation

final class EventListViewModel {
    
    //MARK: - Properties
    let title = "Events"
    var coordinator: EventListCoordinator?
    
    //MARK: - Helpers
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
}
