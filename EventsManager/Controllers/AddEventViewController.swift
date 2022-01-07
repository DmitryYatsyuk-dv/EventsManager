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
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
//    deinit {
//        print("deinit from AddEventViewController")
//    }
}

//MARK: - UITableViewDataSource
extension AddEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cell(for: indexPath)
        switch cellViewModel {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
            cell.update(with: titleSubtitleCellViewModel)
            return cell
        case .titleImage:
            return UITableViewCell()
        }
    }
    
    
}
