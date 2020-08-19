//
//  HomeViewController.swift
//  AroundTheMetro
//
//  Created by Artem Alexandrov on 19.08.2020.
//  Copyright © 2020 AugmentedDiscovery. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Outlets

    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
        }
    }

    // MARK: - Properties

    var userStorage: UserStorageService? {
        didSet {
            title = userStorage?.currentCity
        }
    }
    var bannersRepository: BannersRepositoryType?

    var menuItems: [MenuItem] = []

    var onLeftBarButton: (() -> Void)?
    var onRightBarButton: (() -> Void)?

    // MARK: - Private Properties

    var banners: [Banner] = []

    // MARK: - Actions

    @IBAction func leftBarButtonAction() {
        onLeftBarButton?()
    }

    @IBAction func rightBarButtonAction() {
        onRightBarButton?()
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        guard let country = userStorage?.currentCountry, let city = userStorage?.currentCity else { return }
        bannersRepository?.getBanners(country: country, city: city, with: { [weak self] result in
            switch result {
            case .success(let banners):
                self?.banners = banners
                self?.tableView.reloadData()
            case .failure(_):
                // TODO: Handle error
                break
            }
        })
    }
}

extension HomeViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = UIScreen.main.bounds.width
        let height = width / (1242.0/708.0)
        switch indexPath.section {
        case 0: return height
        case 1: return 450
        default: return 0
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannersCell.identifier) as! BannersCell
            cell.banners = banners
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier) as! MenuCell
            cell.menuItems = menuItems
            return cell

        default:
            return UITableViewCell()
        }
    }
}
