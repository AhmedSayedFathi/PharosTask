//
//  AppAppearence.swift
//  PharosTechnicalTask
//
//  Created by Ahmed Sayed Fathi on 16/08/2023.
//

import UIKit

final class AppAppearance {
    
    static var shared = AppAppearance()
    
    private init() {}
    
    func setupAppearance() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
        }
        UINavigationBar.appearance().tintColor = .label
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 16, weight: .bold)]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().prefersLargeTitles = true
        UITextField.appearance().keyboardAppearance = .dark
    }
}
