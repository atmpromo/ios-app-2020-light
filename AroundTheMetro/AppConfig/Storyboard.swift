//
//  Storyboard.swift
//  AroundTheMetro
//
//  Created by Artem Alexandrov on 19.08.2020.
//  Copyright © 2020 AugmentedDiscovery. All rights reserved.
//

import UIKit

protocol StoryboardType {
    static var name: String { get }
    static var storyboard: UIStoryboard { get }
}

extension StoryboardType {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}

enum Storyboard {
    enum Menu: StoryboardType {
        static let name = "Menu"

        static let menuVC = storyboard.instantiateInitialViewController() as! MenuViewController
        static let changeCityVC = storyboard.instantiateViewController(identifier: "ChangeCityViewController") as! ChangeCityViewController
    }
    
    enum Home: StoryboardType {
        static let name = "Home"

        static let homeVC = storyboard.instantiateInitialViewController() as! HomeViewController
        static let locateMetroVC = storyboard.instantiateViewController(identifier: "LocateMetroViewController") as! LocateMetroViewController
        static let metroPlanVC = storyboard.instantiateViewController(identifier: "MetroPlanViewController") as! MetroPlanViewController
    }

    enum Places: StoryboardType {
        static let name = "Places"

        static let placesVC = storyboard.instantiateViewController(identifier: "PlacesViewController") as! PlacesViewController

        static let allPlacesListVC = storyboard.instantiateViewController(identifier: "AllPlacesListViewController") as! AllPlacesListViewController
        static let metroListVC = storyboard.instantiateViewController(identifier: "MetroListViewController") as! MetroListViewController

        static let placeDetailsVC = storyboard.instantiateViewController(identifier: "PlaceDetailViewController") as! PlaceDetailViewController
    }
}