//
//  ProfileViewController.swift
//  Demodog
//
//  Created by Nik Y on 14.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
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
        setupSettingsButton()
        setupTable()
    }
    
    private func setupTable() {
        
    }
    
    private func setupSettingsButton() {
        
    }
}
