//
//  Theme.swift
//  Image Converter
//
//  Created by Marco Scaglione on 13/12/21.
//

import Foundation
import SwiftUI

class Theme{
    static func navigationBarColors (background: UIColor?, titleColor: UIColor? = nil,tintColor: UIColor? = nil)
    {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithTransparentBackground()
        navigationAppearance.backgroundColor = background ?? .clear
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        UINavigationBar.appearance().tintColor = tintColor ?? tintColor ?? .black
    }
}
