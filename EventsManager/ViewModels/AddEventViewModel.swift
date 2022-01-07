//
//  AddEventViewModel.swift
//  EventsManager
//
//  Created by Lucky on 07.01.2022.
//

import UIKit

final class AddEventViewModel {
    
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    private(set) var cells: [Cell] = []
    var coordinator: AddEventCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name")
            ),
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date")
            )
        ]
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    //    deinit {
    //        print("deinit from AddEventViewModel")
    //    }
}
