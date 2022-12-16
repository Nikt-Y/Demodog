//
//  TimerViewController.swift
//  Demodog
//
//  Created by Nik Y on 16.12.2022.
//

import UIKit

class TimerViewController: UIViewController {
    private let progressBar = CircularProgressBarView(radius: 133)
    private let titleLabel = UILabel()
    private let minutesLabel = UILabel()
    private let stopButton = UIButton()
    private let saveButton = UIButton()
    private var timer = Timer()
    private var isTimerStarted = false
    private var time = 0.0
    private var initialTime = 60.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        initialTime = Double(time)
        view.backgroundColor = Style().darkGrey
        setupProgressBar()
        setupTitle()
        setupMinutes()
        setupStopButton()
        setupSaveButton()
    }
    
    private func setupProgressBar() {
        view.addSubview(progressBar)
        progressBar.pinTop(to: view, 350)
        progressBar.pinCenter(to: view.centerXAnchor)
    }
    
    private func setupTitle() {
        titleLabel.text = "Прогулка"
        titleLabel.textColor = Style().white
        titleLabel.font = .systemFont(ofSize: 24, weight: .medium)
        titleLabel.numberOfLines = 1
        view.addSubview(titleLabel)
        titleLabel.pinTop(to: progressBar.topAnchor, 100)
        titleLabel.pinCenter(to: view.centerXAnchor)
    }
    
    private func setupMinutes() {
        minutesLabel.text = formatTime()
        minutesLabel.textColor = Style().white
        minutesLabel.font = .systemFont(ofSize: 24, weight: .medium)
        minutesLabel.numberOfLines = 1
        view.addSubview(minutesLabel)
        minutesLabel.pinTop(to: titleLabel.bottomAnchor, 15)
        minutesLabel.pinCenter(to: view.centerXAnchor)
    }
    
    private func setupStopButton() {
        stopButton.setImage(UIImage(named: "start"), for: .normal)
        stopButton.addTarget(self, action: #selector(stopButtonIsTapped), for: .touchUpInside)
        view.addSubview(stopButton)
        stopButton.pinTop(to: progressBar.bottomAnchor, 61)
        stopButton.pinCenter(to: view.centerXAnchor)
        stopButton.setHeight(to: 63)
        stopButton.setWidth(to: 63)
    }
    
    private func setupSaveButton() {
        saveButton.setTitle("СОХРАНИТЬ", for: .normal)
        saveButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        saveButton.setTitleColor(Style().darkGrey, for: .normal)
        saveButton.backgroundColor = Style().white
        saveButton.layer.cornerRadius = 25
        saveButton.setHeight(to: 45)
        saveButton.addTarget(self, action: #selector(saveButtonIsTapped),
                            for: .touchUpInside)
        saveButton.isEnabled = true
        view.addSubview(saveButton)
        saveButton.pinLeft(to: view, 37)
        saveButton.pinRight(to: view, 37)
        saveButton.pinTop(to: stopButton.bottomAnchor, 30)
    }
    
    private func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc
    private func updateTimer(){
        time += 1
        minutesLabel.text = formatTime()
        progressBar.progressAnimation(duration: 0.99, progress: Double(time)/(initialTime ))
    }
    
    @objc
    private func stopButtonIsTapped() {
        if !isTimerStarted{
            startTimer()
            isTimerStarted = true
            
            stopButton.setImage(UIImage(named: "stop"), for: .normal)
        } else {
            timer.invalidate()
            isTimerStarted = false
            stopButton.setImage(UIImage(named: "start"), for: .normal)
        }
    }
    
    @objc
    private func saveButtonIsTapped() {
        
    }
    
    private func formatTime()->String{
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}
