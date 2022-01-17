//
//  EventsCellBuilder.swift
//  EventsManager
//
//  Created by Lucky on 17.01.2022.
//

import Foundation

struct EventsCellBuilder {
    func makeTitleSubtitleCellViewModel(
        _ type: TitleSubtitleCellViewModel.CellType,
        onCellUpdate: (() -> Void)? = nil
    ) -> TitleSubtitleCellViewModel {
        
        switch type {
        case .text:
            return TitleSubtitleCellViewModel(
                title: "Name",
                subtitle: "",
                placeholder: "Add a name",
                type: .text,
                onCellUpdate: onCellUpdate
            )
        case .data:
            return TitleSubtitleCellViewModel(
                title: "Date",
                subtitle: "",
                placeholder: "Select a date",
                type: .data,
                onCellUpdate: onCellUpdate
            )
        case .image:
            return TitleSubtitleCellViewModel(
                title: "Background",
                subtitle: "",
                placeholder: "",
                type: .image,
                onCellUpdate: onCellUpdate)
        }
    }
}
