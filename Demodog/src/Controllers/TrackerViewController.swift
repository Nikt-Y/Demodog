//
//  TrackerViewController.swift
//  Demodog
//
//  Created by Nik Y on 14.12.2022.
//

import UIKit

class TrackerViewController: UIViewController, UITabBarDelegate {
    let style = Style()
    var dataSource: [StatusModel] = [StatusModel()]
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout())
    let layout:UICollectionViewFlowLayout = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = style.red
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func setupUI() {
        view.backgroundColor = style.white
        setupHeader()
        setupCollectionView()
    }

    private func setupHeader() {
        
    }
    
    private func setupCollectionView() {
        collectionView.register(StatusView.self, forCellWithReuseIdentifier: StatusView.reuseIdentifier)
        layout.scrollDirection = .vertical
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        view.addSubview(collectionView)
        collectionView.pin(to: view)
    }
}

extension TrackerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let statusView = collectionView.dequeueReusableCell(
            withReuseIdentifier: StatusView.reuseIdentifier,
            for: indexPath
        ) as? StatusView {
            statusView.configure(with: dataSource[indexPath.row])
            return statusView
        }
        return UICollectionViewCell()
    }
}

extension TrackerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 205)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
