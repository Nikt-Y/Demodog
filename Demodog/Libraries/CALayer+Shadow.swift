//
//  CALayer+Shadow.swift
//  noyakunyushkinPW2
//
//  Created by Nik Y on 11/16/22.
//

import UIKit

extension CALayer {
    func applyShadow(
        color: UIColor = .systemGray,
        opacity: Float = 0.5,
        radius: CGFloat = 10
    ) {
        self.shadowColor = color.cgColor
        self.shadowOpacity = opacity
        self.shadowOffset = .zero
        self.shadowRadius = radius
    }
}
