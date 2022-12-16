//
//  ProfileViewController.swift
//  Demodog
//
//  Created by Nik Y on 14.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    let style = Style()
    var dataSource: [SettingsModel] = [SettingsModel(), SettingsModel(), SettingsModel(), SettingsModel(),]
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout())
    private let settingsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController?.tabBar.tintColor = style.blue
    }
    
    private func setupUI() {
        view.backgroundColor = style.white
        setupSettings()
        setupCollectionView()
    }

    private func setupSettings() {
        settingsButton.setImage(UIImage(named: "settings"), for: .normal)
        view.addSubview(settingsButton)
        settingsButton.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        settingsButton.pinRight(to: view, 27)
    }
    
    private func setupCollectionView() {
        collectionView.register(SettingsInfoCell.self, forCellWithReuseIdentifier: SettingsInfoCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        view.addSubview(collectionView)
        collectionView.pinTop(to: settingsButton.bottomAnchor)
        collectionView.pin(to: view, [.left, .right, .bottom])
    }
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let settingsView = collectionView.dequeueReusableCell(
            withReuseIdentifier: SettingsInfoCell.reuseIdentifier,
            for: indexPath
        ) as? SettingsInfoCell {
            settingsView.configure(with: dataSource[indexPath.row])
            return settingsView
        }
        return UICollectionViewCell()
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 82)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
