//
//  TimerViewController.swift
//  Demodog
//
//  Created by Nik Y on 16.12.2022.
//

import UIKit

class OpenTrackerViewController: UIViewController {
    let startButton = UIButton()
    let exitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = Style().white
        setupStartButton()
        setupExitButton()
    }
    
    private func setupStartButton() {
        startButton.setTitle("НАЧАТЬ ПРОГУЛКУ", for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        startButton.setTitleColor(Style().white, for: .normal)
        startButton.backgroundColor = Style().blue
        startButton.layer.cornerRadius = 25
        startButton.setHeight(to: 45)
        startButton.addTarget(self, action: #selector(startButtonTapped),
                            for: .touchUpInside)
        startButton.isEnabled = true
        view.addSubview(startButton)
        startButton.pinCenter(to: view)
        startButton.pin(to: view, [.left, .right])
    }
    
    private func setupExitButton() {
        exitButton.setTitle("ВЫЙТИ", for: .normal)
        exitButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        exitButton.setTitleColor(Style().white, for: .normal)
        exitButton.backgroundColor = Style().lightGrey
        exitButton.layer.cornerRadius = 25
        exitButton.setHeight(to: 45)
        exitButton.addTarget(self, action: #selector(exitButtonTapped),
                            for: .touchUpInside)
        exitButton.isEnabled = true
        view.addSubview(exitButton)
        exitButton.pin(to: view, [.left, .right])
        exitButton.pinTop(to: startButton.bottomAnchor, 10)
    }
    
    @objc
    private func startButtonTapped() {
        let timerVC = TimerViewController()
        navigationController?.pushViewController(timerVC, animated: true)
    }
    
    @objc
    private func exitButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
