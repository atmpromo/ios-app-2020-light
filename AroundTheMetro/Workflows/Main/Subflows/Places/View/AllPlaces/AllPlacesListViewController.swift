//
//  AllPlacesListViewController.swift
//  AroundTheMetro
//
//  Created by Artem Alexandrov on 22.08.2020.
//  Copyright © 2020 AugmentedDiscovery. All rights reserved.
//

import UIKit

class AllPlacesListViewController: UIViewController {
    // MARK: - Properties

    var places: [Place] = [] {
        didSet {
            if isViewLoaded {
                placesTableView.reloadData()
            }
        }
    }

    var onOpenDetails: ((Place) -> Void)?

    // MARK: - Outlets

    @IBOutlet var placesTableView: UITableView!

    // MARK: - Private properties

    // MARK: - Lifecycle
}

extension AllPlacesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if places.indices.contains(indexPath.row) {
            onOpenDetails?(places[indexPath.row])
        }
    }
}

extension AllPlacesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceListCell.reuseID) as! PlaceListCell

        if places.indices.contains(indexPath.row) {
            cell.configure(with: places[indexPath.row])
        }

        return cell
    }
}
