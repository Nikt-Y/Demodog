//
//  Colors.swift
//  Demodog
//
//  Created by Nik Y on 14.12.2022.
//

import UIKit

struct Style {
    let red: UIColor = .red
    let blue: UIColor = .blue
//    let black: UIColor = .black
    let darkGrey: UIColor = UIColorFromRGB(rgbValue: 0x2E2E2E)
    let white: UIColor = .white
    let lightGrey: UIColor = .lightGray
    let noBrightRed: UIColor = UIColorFromRGB(rgbValue: 0xC81C1C)
    let noBrightBlue: UIColor = UIColorFromRGB(rgbValue: 0x3333AB)
}

func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
