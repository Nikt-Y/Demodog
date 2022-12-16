//
//  ViewController.swift
//  Demodog
//
//  Created by Nik Y on 14.12.2022.
//

import UIKit

class HomeViewController: UIViewController {
    let style = Style()
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
        tabBarController?.tabBar.tintColor = style.blue
    }
    
    private func setupUI() {
        view.backgroundColor = style.white
        setupHeader()
        setupDog()
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
    
    private func setupDog() {
        let dogImage = UIImage(named: "dog")
        let dogIV = UIImageView(image: dogImage)
        view.addSubview(dogIV)
        dogIV.pinCenter(to: view.centerXAnchor)
        dogIV.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, 66)
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

