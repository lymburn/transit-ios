//
//  Extensions.swift
//  transit-ios
//
//  Created by Eugene Lu on 2021-02-10.
//

import Foundation
import UIKit

extension UIImage {
    // Recolors an UIImage
    func tinted(with color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        withRenderingMode(.alwaysTemplate).draw(in: CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIColor {
    static func hexToColor(hex: String) -> UIColor? {
        let red, green, blue: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            // Contains rgb with 6 hex values
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                // Mask and shift to get rgb values
                if scanner.scanHexInt64(&hexNumber) {
                    red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    blue = CGFloat((hexNumber & 0x0000ff)) / 255

                    return UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
                }
            }
        }
        
        return nil
    }
}
