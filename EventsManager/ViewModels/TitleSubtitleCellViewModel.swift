//
//  TitleSubtitleCellViewModel.swift
//  EventsManager
//
//  Created by Lucky on 07.01.2022.
//

import UIKit

final class TitleSubtitleCellViewModel {
    
    //MARK: - Properties
    enum CellType {
        case text
        case data
        case image
    }
    
    private(set) var subtitle: String
    
    let title: String
    let placeholder: String
    let type: CellType
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyy"
        return dateFormatter
    }()
    
    private(set) var image: UIImage?
    private(set) var onCellUpdate: () -> Void = {}
    
    
    init(title: String, subtitle: String, placeholder: String,
         type: CellType, onCellUpdate: @escaping () -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
        self.type = type
        self.onCellUpdate = onCellUpdate
    }
    
    //MARK: - Helpers
    func update(_ subtitle: String) {
        self.subtitle = subtitle
    }
    
    func update(_ date: Date) {
        let dateString = dateFormatter.string(from: date)
        self.subtitle = dateString
        // reload cell
        onCellUpdate()
    }
    
    func update(_ image: UIImage) {
        self.image = image
        onCellUpdate()
    }
}

