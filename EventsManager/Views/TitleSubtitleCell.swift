//
//  TitleSubtitleCell.swift
//  EventsManager
//
//  Created by Lucky on 07.01.2022.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell {
   
    //MARK: - Properties
    private let titleLabel = UILabel()
    let subtitleTextField = UITextField()
    
    private let verticalStackView = UIStackView()
    private let constant: CGFloat = 15
    
    private let datePickerView = UIDatePicker()
    private let toolBar = UIToolbar(frame: .init(x: 0, y: 0, width: 100, height: 100))
    
    lazy var doneButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .done, target: self,
                        action: #selector(tappedDoneBarButton))
    }()
    
    private var viewModel: TitleSubtitleCellViewModel?
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    @objc
    private func tappedDoneBarButton() {
        viewModel?.update(datePickerView.date)
    }
    
    //MARK: - Helpers
    func update(with viewModel: TitleSubtitleCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
        
        subtitleTextField.inputView = viewModel.type == .text ? nil : datePickerView
        subtitleTextField.inputAccessoryView = viewModel.type == .text ? nil : toolBar
    }
    
    private func setupViews() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        
        [verticalStackView, titleLabel, subtitleTextField]
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        toolBar.setItems([doneButton], animated: false)
        updateDatePicker()
    }
    
    private func updateDatePicker() {
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.datePickerMode = .date
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextField)
    }
    
    //MARK: - Layout
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: constant),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constant),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: constant),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -constant)
        ])
    }
}

