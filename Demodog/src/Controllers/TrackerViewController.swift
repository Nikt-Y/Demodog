//
//  TrackerViewController.swift
//  Demodog
//
//  Created by Nik Y on 14.12.2022.
//

import UIKit

class TrackerViewController: UIViewController {
    let style = Style()
    var dataSource: [StatusModel] = [StatusModel(), StatusModel(), StatusModel(), StatusModel(),]
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout())
    private let header = PerDropsDown()
    private var isOpen = false
    private var closedConstrain: NSLayoutConstraint?
    private var openConstrain: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        header.addTarget(self, action: #selector(openDropDown), for: .touchUpInside)
        view.addSubview(header)
        header.pinTop(to: view.safeAreaLayoutGuide.topAnchor, -20)
        header.pinLeft(to: view, 20)
        header.pinRight(to: view, 20)
        openConstrain = header.setHeight(to: 214)
        openConstrain?.isActive = false
        closedConstrain = header.setHeight(to: 52)
    }
    
    private func setupCollectionView() {
        collectionView.register(StatusBigCell.self, forCellWithReuseIdentifier: StatusBigCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear
        view.addSubview(collectionView)
        collectionView.pinTop(to: header.bottomAnchor)
        collectionView.pin(to: view, [.left, .right, .bottom])
    }
    
    @objc
    func openDropDown() {
        if self.isOpen {
            self.openConstrain?.isActive = false
            self.closedConstrain?.isActive = true
        } else {
            self.closedConstrain?.isActive = false
            self.openConstrain?.isActive = true
        }
        isOpen.toggle()
        header.rotateTriangle(isOpen: isOpen)
    }
}

extension TrackerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let statusView = collectionView.dequeueReusableCell(
            withReuseIdentifier: StatusBigCell.reuseIdentifier,
            for: indexPath
        ) as? StatusBigCell {
            statusView.configure(with: dataSource[indexPath.row])
            return statusView
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let openTrackerVC = OpenTrackerViewController()
        navigationController?.pushViewController(openTrackerVC, animated: true)
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
