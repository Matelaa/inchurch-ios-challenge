//
//  FavoritesViewController.swift
//  inchurch-ios-challenge
//
//  Created by matela on 07/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var movies: [MovieView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = L10n.Favorites.title
        self.view.backgroundColor = .black
        
        self.movies = MovieViewModel.getFavorites()
        self.setupTableView()
        self.setupView()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(cellType: FavoritesTableViewCell.self)
    }
    
    private func setupView() {
        self.view.addSubview(self.tableView)
        
        self.setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalToSystemSpacingBelow: self.view.layoutMarginsGuide.topAnchor, multiplier: 1),
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        self.tableView.backgroundColor = .black
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as FavoritesTableViewCell
        cell.bind(movie: self.movies[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
