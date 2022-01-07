//
//  EventListViewController.swift
//  EventsManager
//
//  Created by Lucky on 28.12.2021.
//

import UIKit

class EventListViewController: UIViewController {
    
    //MARK: - Properties
    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "EventListViewController") as! EventListViewController
        
        return controller
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationTitle()
        setRightBarButton()
        
    }
    //MARK: - Actions
    @objc
    private func tappedRightBarButton() {
        print("DEBUG: Tapped right bar button")
    }
    
    //MARK: - Helpers
    
    private func setNavigationTitle() {
        let navigationTitle = "Events"
        title = navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    private func setRightBarButton() {
        let image = UIImage(systemName: "plus.square.fill")
        let barButtonItem = UIBarButtonItem(image: image,
                                            style: .plain,
                                            target: self,
                                            action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = UIColor.primary
        navigationItem.rightBarButtonItem = barButtonItem
        
    }
}
