//
//  AddEventViewModel.swift
//  EventsManager
//
//  Created by Lucky on 07.01.2022.
//

import UIKit

final class AddEventViewModel {
    
    let title = "Add"
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }
    
    private(set) var cells: [Cell] = []
    var coordinator: AddEventCoordinator?
    
    
    //MARK: - Helpers
    func viewDidLoad() {
        cells = [
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Name",
                                           subtitle: "",
                                           placeholder: "Add a name",
                                           type: .text,
                                           onCellUpdate: {})
            ),
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Date",
                                           subtitle: "",
                                           placeholder: "Select a date",
                                           type: .data,
                                           onCellUpdate: { [weak self] in
                                            self?.onUpdate()
                                           })
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
    
    func tappedDone() {
        print("DEBUG: tapped Done")
        // extract info from cell view models & save in core data.
        // tell coordinator to dismiss
    }
    
    func updateCell(indexPath: IndexPath, subtitle: String) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleViewModel):
            titleSubtitleViewModel.update(subtitle)
        case .titleImage:
            break
        }
    }
    
    //    deinit {
    //        print("deinit from AddEventViewModel")
    //    }
}
