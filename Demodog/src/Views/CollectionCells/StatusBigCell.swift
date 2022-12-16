//
//  StatusView.swift
//  Demodog
//
//  Created by Nik Y on 15.12.2022.
//

import UIKit

final class StatusBigCell: UICollectionViewCell {
    static let reuseIdentifier = "StatusBigCell"
    private let statusImageView = UIImageView()
    private let statusTitleLabel = UILabel()
    private let statusProgressLabel = UILabel()
    private let openButton = UIButton(configuration: .plain())
    private let circularProgressBarView = CircularProgressBarView(radius: 47.5)

    var circularViewDuration: TimeInterval = 2
    
    public func configure(with statusModel: StatusModel) {
        statusTitleLabel.text = statusModel.title
        statusProgressLabel.text = "\(Int(100*statusModel.progress))%"
        statusImageView.image = UIImage(named: statusModel.imageName)
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        self.backgroundColor = Style().darkGrey
        self.layer.cornerRadius = 20
        setUpCircularProgressBarView()
        setupImageView()
        setupTitleLabel()
        setupProgressLabel()
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
    
    private func setupProgressLabel() {
        statusProgressLabel.font = .systemFont(ofSize: 12, weight: .medium)
        statusProgressLabel.textColor = Style().white
        statusProgressLabel.numberOfLines = 1
        self.addSubview(statusProgressLabel)
        statusProgressLabel.pinTop(to: statusImageView.bottomAnchor, 10)
        statusProgressLabel.pinCenter(to: self.centerXAnchor)
    }
    
    func setUpCircularProgressBarView() {
        circularProgressBarView.progressAnimation(duration: 1, progress: 0.8)
        self.addSubview(circularProgressBarView)
        circularProgressBarView.pinTop(to: self, 68.5)
        circularProgressBarView.pinCenter(to: self.centerXAnchor)
    }
    
    private func setupOpenButton() {
        openButton.backgroundColor = Style().white
        openButton.layer.cornerRadius = UIFont.buttonFontSize
        openButton.setTitle("ОТКРЫТЬ", for: .normal)
        openButton.setTitleColor(.black, for: .normal)
        openButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        self.addSubview(openButton)
        openButton.pinBottom(to: self, 13)
        openButton.pinCenter(to: self.centerXAnchor)
        openButton.setWidth(to: 139)
    }
    
    @objc
    func buttonTap() {
//        circularProgressBarView.progressLayer.strokeEnd = 0.6
//        circularProgressBarView.progres//
    }
}
