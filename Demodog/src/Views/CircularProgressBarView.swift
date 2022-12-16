//
//  CircularProgressBarView.swift
//  Demodog
//
//  Created by Nik Y on 16.12.2022.
//

import UIKit

class CircularProgressBarView: UIView {
    // MARK: - Properties
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    init(radius: Double) {
        super.init(frame: .zero)
        createCircularPath(radius)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func createCircularPath(_ radius: Double) {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: radius, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 6.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = Style().white.cgColor
        layer.addSublayer(circleLayer)
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 6.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = Style().red.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval, progress: Double) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.fromValue = progressLayer.strokeEnd
        circularProgressAnimation.toValue = progress
        progressLayer.strokeEnd = progress
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
