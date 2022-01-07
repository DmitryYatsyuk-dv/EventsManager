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
    private let subtitleTextField = UITextField()
    private let verticalStackView = UIStackView()
    private let constant: CGFloat = 15
    
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
    
    //MARK: - Helpers
    func update(with viewModel: TitleSubtitleCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
    }
    
    private func setupViews() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        
        [verticalStackView, titleLabel, subtitleTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextField)
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: constant),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constant),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: constant),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -constant)
        ])
    }
}

