//
//  ViewController.swift
//  Demodog
//
//  Created by Nik Y on 14.12.2022.
//

import UIKit

class HomeViewController: UIViewController {
    let style = Style()

 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.tintColor = style.blue
    }
    
    private func setupUI() {
        view.backgroundColor = style.white
        setupHeader()
        setupDog()
    }
    
    private func setupHeader() {
        
    }
    
    private func setupDog() {
        let dogImage = UIImage(named: "dog")
        let dogIV = UIImageView(image: dogImage)
        view.addSubview(dogIV)
        dogIV.pinCenter(to: view.centerXAnchor)
        dogIV.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, 66)
    }
}

