//
//  Appearance.swift
//  AroundTheMetro
//
//  Created by Artem Alexandrov on 19.08.2020.
//  Copyright © 2020 AugmentedDiscovery. All rights reserved.
//

import UIKit

struct Appearance {
    static func setup() {
        setupNavigationBar()
    }

    private static func setupNavigationBar() {
        let backButtonImage = UIImage(named: "back_btn")
        UINavigationBar.appearance().backIndicatorImage = backButtonImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backButtonImage

        UINavigationBar.appearance().tintColor = UIColor.systemGray
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -300, vertical: -3.5),
                                                                          for: .default)
    }
}
