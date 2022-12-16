//
//  StatusSmallCell.swift
//  Demodog
//
//  Created by Nik Y on 16.12.2022.
//

import UIKit

final class StatusSmallCell: UICollectionViewCell {
    static let reuseIdentifier = "StatusSmallCell"
    private let statusImageView = UIImageView()
    private let statusProgressLabel = UILabel()
    private var color:UIColor?
    
    public func configure(with statusModel: StatusModel, color: UIColor = Style().blue) {
        if (statusModel.numOfSections == 1) {
            statusProgressLabel.text = "\(Int(100*statusModel.progress))%"
        } else {
            let counter = Int(100*statusModel.progress)/(100/statusModel.numOfSections)
            statusProgressLabel.text = "\(counter) из \(statusModel.numOfSections)"
        }
        statusImageView.image = UIImage(named: statusModel.imageName)
        self.color = color
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        self.backgroundColor = Style().white
        self.layer.cornerRadius = 25
        setupImageView()
        setupProgressLabel()
    }
    
    private func setupImageView() {
        statusImageView.contentMode = .scaleAspectFill
        statusImageView.tintColor = color
        self.addSubview(statusImageView)
        statusImageView.pinLeft(to: self, 13)
        statusImageView.pinCenter(to: self.centerYAnchor)
    }
    
    private func setupProgressLabel() {
        statusProgressLabel.font = .systemFont(ofSize: 20, weight: .medium)
        statusProgressLabel.textColor = color
        statusProgressLabel.numberOfLines = 1
        self.addSubview(statusProgressLabel)
        statusProgressLabel.pinCenter(to: self.centerXAnchor, 15)
        statusProgressLabel.pinCenter(to: self.centerYAnchor)
    }
}

