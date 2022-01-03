//
//  EventListViewController.swift
//  EventsManager
//
//  Created by Lucky on 28.12.2021.
//

import UIKit

class EventListViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: EventListViewModel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationTitle()
        setRightBarButton()
        
    }
    //MARK: - Actions
    @objc
    private func tappedAddEventButton() {
        viewModel.tappedAddEvent()
    }
    
    //MARK: - Helpers
    
    private func setNavigationTitle() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setRightBarButton() {
        guard let image = UIImage(systemName: "plus.app.fill") else { return }
        
        let barButtonItem = UIBarButtonItem(image: image,
                                            style: .plain,
                                            target: self,
                                            action: #selector(tappedAddEventButton))
        
        barButtonItem.tintColor = UIColor.primary
        navigationItem.rightBarButtonItem = barButtonItem
    }
}
