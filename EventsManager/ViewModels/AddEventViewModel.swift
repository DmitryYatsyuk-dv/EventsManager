//
//  AddEventViewModel.swift
//  EventsManager
//
//  Created by Lucky on 07.01.2022.
//

import UIKit

final class AddEventViewModel {
    
    //MARK: - Properties
    let title = "Add"
    var onUpdate: () -> Void = {}
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
    var coordinator: AddEventCoordinator?
    
    private var nameCellViewModel: TitleSubtitleCellViewModel?
    private var dateCellViewModel: TitleSubtitleCellViewModel?
    private var backgroundImageCellViewModel: TitleSubtitleCellViewModel?
    
    //MARK: - Lifecycle
    func viewDidLoad() {
        setupCells()
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    //MARK: - Helpers
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
        }
    }
    
    func  didSelectRow(at indexPath: IndexPath) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            guard titleSubtitleCellViewModel.type == .image else {
                return
            }
            coordinator?.showImagePicker { image in
                titleSubtitleCellViewModel.update(image)
            }
        }
    }
    //    deinit {
    //        print("deinit from AddEventViewModel")
    //    }
}

private extension AddEventViewModel {
    func setupCells() {
        nameCellViewModel = TitleSubtitleCellViewModel(title: "Name",
                                                       subtitle: "",
                                                       placeholder: "Add a name",
                                                       type: .text,
                                                       onCellUpdate: {})
        
        dateCellViewModel = TitleSubtitleCellViewModel(title: "Date",
                                                       subtitle: "",
                                                       placeholder: "Select a date",
                                                       type: .data,
                                                       onCellUpdate: { [weak self] in
                                                        self?.onUpdate()
                                                       })
        
        backgroundImageCellViewModel = TitleSubtitleCellViewModel(title: "Background",
                                                                  subtitle: "",
                                                                  placeholder: "",
                                                                  type: .image,
                                                                  onCellUpdate: { [weak self] in
                                                                    self?.onUpdate()
                                                                  })
        guard
            let nameCellViewModel = nameCellViewModel,
            let dateCellViewModel = dateCellViewModel,
            let backgroundImageCellViewModel = backgroundImageCellViewModel
        else { return }
        
        cells = [
            .titleSubtitle(
                nameCellViewModel
            ),
            .titleSubtitle(
                dateCellViewModel
            ),
            .titleSubtitle(
                backgroundImageCellViewModel
            )
        ]
    }
}
