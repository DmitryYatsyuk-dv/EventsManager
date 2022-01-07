//
//  TitleSubtitleCellViewModel.swift
//  EventsManager
//
//  Created by Lucky on 07.01.2022.
//

import UIKit

final class TitleSubtitleCellViewModel {
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    
    init(title: String, subtitle: String, placeholder: String) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
}

