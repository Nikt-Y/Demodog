//
//  StatusView.swift
//  Demodog
//
//  Created by Nik Y on 15.12.2022.
//

import UIKit


final class StatusView: UICollectionViewCell {
    static let reuseIdentifier = "StatusView"
    private let statusImageView = UIImageView()
    private let statusTitleLabel = UILabel()
    private let statusProgressLabel = UILabel()
    private let openButton = UIButton()
    
    public func configure(with statusModel: StatusModel) {
        statusTitleLabel.text = statusModel.title
        statusProgressLabel.text = String(statusModel.progress)
        statusImageView.image = UIImage(named: statusModel.imageName)
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        self.backgroundColor = Style().darkGrey
        self.setHeight(to: 206)
        self.setWidth(to: 165)
        setupImageView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupOpenButton()
    }
    
    private func setupImageView() {
        statusImageView.contentMode = .scaleAspectFill
        statusImageView.tintColor = Style().red
        self.addSubview(statusImageView)
        statusImageView.pinTop(to: self, 45)
        statusImageView.pinCenter(to: self.centerXAnchor)
    }
    
    private func setupTitleLabel() {
        statusTitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        statusTitleLabel.textColor = Style().white
        statusTitleLabel.numberOfLines = 1
        self.addSubview(statusTitleLabel)
        statusTitleLabel.pinBottom(to: self, 61)
        statusTitleLabel.pinCenter(to: self.centerXAnchor)
    }
    
    private func setupDescriptionLabel() {
        statusTitleLabel.font = .systemFont(ofSize: 10, weight: .medium)
        statusTitleLabel.textColor = Style().white
        statusTitleLabel.numberOfLines = 1
        self.addSubview(statusTitleLabel)
        statusTitleLabel.pinBottom(to: self, 111)
        statusTitleLabel.pinCenter(to: self.centerXAnchor)
    }
    
    private func setupOpenButton() {
        openButton.backgroundColor = Style().white
        openButton.layer.cornerRadius = 25
        openButton.setTitle("ОТКРЫТЬ", for: .normal)
        openButton.pinBottom(to: self, 13)
        openButton.pinCenter(to: self.centerXAnchor)
    }
}
