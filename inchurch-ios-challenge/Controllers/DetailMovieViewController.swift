//
//  DetailMovieViewController.swift
//  inchurch-ios-challenge
//
//  Created by matela on 10/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {

    private let filmBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0.5
        return image
    }()
    
    private let pictureMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let releaseDate: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private let titleFilm: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let favorite: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(DetailMovieViewController.favoriteMovie), for: .touchUpInside)
        return button
    }()
    
    private let overview: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var movieId: Int = 0
    var movie: MovieView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movie = MovieViewModel.get(by: self.movieId)
        self.setupView()
        self.bind(movie: self.movie)
    }
    
    private func bind(movie: MovieView) {
        self.movie = movie
        self.filmBackground.setImage(self.movie.imageUrl)
        self.pictureMovie.setImage(self.movie.imageUrl)
        self.releaseDate.text = L10n.Detail.releaseDate(self.movie.releaseDate)
        self.titleFilm.text = self.movie.title
        self.favorite.setImage(self.movie.favorite ? Asset.icStarFull.image : Asset.icStar.image, for: .normal)
        self.overview.text = self.movie.overview
    }
    
    private func setupView() {
        self.title = self.movie.title
        
        self.view.addSubview(self.filmBackground)
        self.view.addSubview(self.pictureMovie)
        self.view.addSubview(self.releaseDate)
        self.view.addSubview(self.titleFilm)
        self.view.addSubview(self.favorite)
        self.view.addSubview(self.overview)
        
        self.setupFilmBackgroundPictureConstraints()
        self.setupFilmPictureConstraints()
        self.setupReleaseDateConstraints()
        self.setupTitleFilmConstraints()
        self.setupFavoriteButtonConstraints()
        self.setupOverviewConstraints()
    }
    
    private func setupFilmBackgroundPictureConstraints() {
        NSLayoutConstraint.activate([
            self.filmBackground.topAnchor.constraint(equalToSystemSpacingBelow: self.view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            self.filmBackground.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.filmBackground.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.filmBackground.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupFilmPictureConstraints() {
        NSLayoutConstraint.activate([
            self.pictureMovie.centerYAnchor.constraint(equalTo: self.filmBackground.centerYAnchor),
            self.pictureMovie.centerXAnchor.constraint(equalTo: self.filmBackground.centerXAnchor),
            self.pictureMovie.heightAnchor.constraint(equalToConstant: 240),
            self.pictureMovie.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private func setupReleaseDateConstraints() {
        NSLayoutConstraint.activate([
            self.releaseDate.topAnchor.constraint(equalTo: self.filmBackground.bottomAnchor, constant: 12),
            self.releaseDate.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12),
            self.releaseDate.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func setupTitleFilmConstraints() {
        NSLayoutConstraint.activate([
            self.titleFilm.topAnchor.constraint(equalTo: self.releaseDate.bottomAnchor, constant: 12),
            self.titleFilm.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12),
            self.titleFilm.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            self.favorite.centerYAnchor.constraint(equalTo: self.titleFilm.centerYAnchor),
            self.favorite.leftAnchor.constraint(equalTo: self.titleFilm.rightAnchor, constant: 12),
            self.favorite.heightAnchor.constraint(equalToConstant: 30),
            self.favorite.widthAnchor.constraint(equalToConstant: 30)
        ])
        self.favorite.tintColor = .yellow
    }
    
    private func setupOverviewConstraints() {
        NSLayoutConstraint.activate([
            self.overview.topAnchor.constraint(equalTo: self.titleFilm.bottomAnchor, constant: 20),
            self.overview.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 12),
            self.overview.rightAnchor.constraint(equalTo: self.favorite.rightAnchor)
        ])
    }
    
    @objc private func favoriteMovie() {
        self.movie = MovieViewModel.favoriteMovie(by: self.movie.id)
        self.favorite.setImage(self.movie.favorite ? Asset.icStarFull.image : Asset.icStar.image, for: .normal)
    }
}
