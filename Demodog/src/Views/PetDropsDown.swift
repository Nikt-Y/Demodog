//
//  PetDropsDown.swift
//  Demodog
//
//  Created by Nik Y on 16.12.2022.
//

import UIKit

class PerDropsDown: UIButton {
    private let petFace = UIImageView()
    private let petName = UILabel()
    private let petGlobalStatus = UILabel()
    private let openDropDown = UIImageView()
    private var dataSource: [StatusModel] =
    [
        StatusModel(), StatusModel(), StatusModel(), StatusModel(),
    ]
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout())
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func rotateTriangle(isOpen: Bool) {
        UIView.transition(
            with: openDropDown,
            duration: 0.33,
            options: .curveLinear,
            animations: {
                let upsideDown = CGAffineTransform(rotationAngle: .pi * -0.999)
                self.openDropDown.transform = isOpen ? upsideDown : .identity
            })
    }
    
    private func setupUI() {
        self.backgroundColor = Style().darkGrey
        self.layer.cornerRadius = 25
        setupHeader()
        setupCollectionView()
    }

    private func setupHeader() {
        setupFaceImage()
        setupPetName()
        setupPetGlobalStatus()
        setupOpenDropDown()
    }
    
    private func setupFaceImage() {
        petFace.image = UIImage(named: "face")
        petFace.tintColor = Style().white
        petFace.contentMode = .scaleAspectFill
        self.addSubview(petFace)
        petFace.pinLeft(to: self, 24)
        petFace.pinTop(to: self, 13)
        petFace.setWidth(to: 34)
        petFace.setHeight(to: 26)
    }
    
    private func setupPetName() {
        petName.text = "ЮКИ"
        petName.textColor = Style().white
        petName.font = .systemFont(ofSize: 24, weight: .medium)
        petName.numberOfLines = 1
        self.addSubview(petName)
        petName.pinTop(to: self, 15)
        petName.pinLeft(to: self, 74)
        petName.setWidth(to: 180)
    }
    
    private func setupPetGlobalStatus() {
        petGlobalStatus.text = "80%"
        petGlobalStatus.textColor = Style().white
        petGlobalStatus.font = .systemFont(ofSize: 20, weight: .medium)
        petGlobalStatus.numberOfLines = 1
        self.addSubview(petGlobalStatus)
        petGlobalStatus.pinTop(to: self, 17)
        petGlobalStatus.pinRight(to: self, 49)
    }
    
    private func setupOpenDropDown() {
        openDropDown.image = UIImage(named: "triangle")
        openDropDown.tintColor = Style().white
        openDropDown.contentMode = .scaleAspectFill
        self.addSubview(openDropDown)
//        openDropDown.pinLeft(to: petGlobalStatus.rightAnchor, 8)
        openDropDown.pinTop(to: self, 18)
        openDropDown.pinRight(to: self, 16)
    }
    
    private func setupCollectionView() {
        collectionView.register(StatusSmallCell.self, forCellWithReuseIdentifier: StatusSmallCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        self.addSubview(collectionView)
        collectionView.pinTop(to: petName.bottomAnchor, 10)
        collectionView.pin(to: self, [.left, .right, .bottom])
    }
}

extension PerDropsDown: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let statusView = collectionView.dequeueReusableCell(
            withReuseIdentifier: StatusSmallCell.reuseIdentifier,
            for: indexPath
        ) as? StatusSmallCell {
            statusView.configure(with: dataSource[indexPath.row])
            return statusView
        }
        return UICollectionViewCell()
    }
}

extension PerDropsDown: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: 47)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        18
    }
}

