//
//  SettingsInfoCell.swift
//  Demodog
//
//  Created by Nik Y on 16.12.2022.
//

import UIKit

final class SettingsInfoCell: UICollectionViewCell {
    static let reuseIdentifier = "SettingsInfoCell"
    private let leftIcon = UIImageView()
    private let rightIcon = UIImageView()
    private let titleLabel = UILabel()
    private var infoLabel = UILabel()
    
    public func configure(with settingsModel: SettingsModel) {
        leftIcon.image = UIImage(named: settingsModel.imageName)
        titleLabel.text = settingsModel.title
        infoLabel.text = settingsModel.info
        rightIcon.image = UIImage(named: "circle")
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        self.backgroundColor = Style().darkGrey
        self.layer.cornerRadius = 20
        setupLeftIcon()
        setupTitle()
        setupInfo()
        setupRightIcon()
    }
    
    private func setupLeftIcon() {
        leftIcon.tintColor = Style().white
        leftIcon.contentMode = .scaleAspectFill
        self.addSubview(leftIcon)
        leftIcon.pinLeft(to: self, 20)
        leftIcon.pinTop(to: self, 16)
        leftIcon.setWidth(to: 45)
        leftIcon.setHeight(to: 49)
    }
    
    private func setupTitle() {
        titleLabel.textColor = Style().white
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.numberOfLines = 1
        self.addSubview(titleLabel)
        titleLabel.pinTop(to: self, 13)
        titleLabel.pinLeft(to: self, 82)
    }
    
    private func setupInfo() {
        infoLabel.textColor = Style().white
        infoLabel.font = .systemFont(ofSize: 14, weight: .medium)
        infoLabel.numberOfLines = 2
        self.addSubview(infoLabel)
        infoLabel.pinTop(to: titleLabel.bottomAnchor, 9)
        infoLabel.pinLeft(to: self, 82)
    }
    
    private func setupRightIcon() {
        rightIcon.tintColor = Style().white
        rightIcon.contentMode = .scaleAspectFill
        self.addSubview(rightIcon)
        rightIcon.pinRight(to: self, 16)
        rightIcon.pinCenter(to: self.centerYAnchor)
    }
}

