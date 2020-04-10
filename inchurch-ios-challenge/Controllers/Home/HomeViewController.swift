//
//  HomeViewController.swift
//  inchurch-ios-challenge
//
//  Created by matela on 06/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    var service: MovieService!
    var movies: [MovieView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupService()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.movies = MovieViewModel.getAll()
        self.collectionView.reloadData()
    }
    
    private func setupService() {
        self.service = MovieService(delegate: self)
        self.startLoading()
        
        self.service.getBestRatedMovies()
    }
    
    private func setupView() {
        self.title = L10n.Home.title
        self.view.backgroundColor = .black
        
        self.view.addSubview(self.collectionView)
        
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(cellType: MovieCollectionViewCell.self)
        
        self.setupCollectionViewConstaints()
    }
    
    private func setupCollectionViewConstaints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalToSystemSpacingBelow: self.view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -12),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension HomeViewController: StatefulViewController, BackingViewProvider {
    var backingView: UIView {
        return self.collectionView
    }
    
    func hasContent() -> Bool {
        return !self.movies.isEmpty
    }
    
    func success(_ type: ResponseType) {
        switch type {
        case .getBestRatedMovies:
            self.movies = MovieViewModel.getAll()
            self.collectionView.reloadData()
            self.update(emptyText: L10n.EmptyText.default)
        default:
            break
        }
        self.endLoading()
    }
    
    func failure(_ type: ResponseType, error: String?) {
        self.endLoading()
        Message.init(text: error, target: self).show()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width == 414 ? 180 : 160,
                      height: UIScreen.main.bounds.size.height == 896 ? 280 : 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 32, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as MovieCollectionViewCell
        cell.delegate = self
        cell.bind(movie: self.movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailMovieViewController()
        vc.movieId = self.movies[indexPath.item].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: MovieCollectionViewCellDelegate {
    func updateFavoriteMovies() {
        self.movies = MovieViewModel.getAll()
    }
}
