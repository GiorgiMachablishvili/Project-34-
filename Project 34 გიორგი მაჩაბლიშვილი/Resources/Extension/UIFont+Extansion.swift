//
//  UIFont+Extansion.swift
//  Project 34 გიორგი მაჩაბლიშვილი
//
//  Created by Gio's Mac on 22.06.24.
//

import UIKit

extension UIFont {
    //MARK: font extension
    static func latoRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func latoBlack(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Black", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func latoBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func latoThin(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Thin", size: size) ?? .systemFont(ofSize: size)
    }
}
