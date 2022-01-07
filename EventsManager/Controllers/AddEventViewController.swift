//
//  AddEventViewController.swift
//  EventsManager
//
//  Created by Lucky on 07.01.2022.
//

import UIKit

class AddEventViewController: UIViewController {
    //MARK: - Properties
    
    var viewModel: AddEventViewModel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
    
//    deinit {
//        print("deinit from AddEventViewController")
//    }
}
