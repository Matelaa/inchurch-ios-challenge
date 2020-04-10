//
//  MovieCollectionViewCell.swift
//  inchurch-ios-challenge
//
//  Created by matela on 08/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

protocol MovieCollectionViewCellDelegate {
    func updateFavoriteMovies()
}

class MovieCollectionViewCell: UICollectionViewCell, Reusable {
    
    private let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let pictureMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameMovie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    private let favorite: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.addTarget(self, action: #selector(MovieCollectionViewCell.favoriteMovie), for: .touchUpInside)
        return button
    }()
    
    var movie: MovieView!
    var delegate: MovieCollectionViewCellDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(movie: MovieView) {
        self.movie = movie
        self.pictureMovie.setImage(movie.imageUrl)
        self.favorite.setImage(self.movie.favorite ? Asset.icStarFull.image : Asset.icStar.image, for: .normal)
        self.nameMovie.text = movie.title
    }
    
    private func configureCell() {
        self.addSubview(self.view)
        self.view.addSubview(self.pictureMovie)
        self.view.addSubview(self.bottomView)
        self.bottomView.addSubview(self.nameMovie)
        self.bottomView.addSubview(self.favorite)
        
        self.setupViewConstraints()
        self.setupPictureMovieConstraints()
        self.setupBottomViewConstraints()
        self.setupNameMovieConstraints()
        self.setupFavoriteButtonConstraints()
        
        self.customizeCell()
    }
    
    private func customizeCell() {
        self.view.layer.cornerRadius = 12
        self.view.layer.borderWidth = 1
        self.view.layer.borderColor = UIColor.clear.cgColor
        self.view.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.view.layer.cornerRadius).cgPath
    }
    
    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.topAnchor),
            self.view.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.view.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupPictureMovieConstraints() {
        NSLayoutConstraint.activate([
            self.pictureMovie.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.pictureMovie.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.pictureMovie.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.pictureMovie.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.pictureMovie.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    private func setupBottomViewConstraints() {
        NSLayoutConstraint.activate([
            self.bottomView.heightAnchor.constraint(equalToConstant: 40),
            self.bottomView.widthAnchor.constraint(equalToConstant: self.frame.width),
            self.bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        self.bottomView.backgroundColor = .gray
    }
    
    private func setupNameMovieConstraints() {
        NSLayoutConstraint.activate([
            self.nameMovie.centerYAnchor.constraint(equalTo: self.bottomView.centerYAnchor),
            self.nameMovie.topAnchor.constraint(equalTo: self.bottomView.topAnchor),
            self.nameMovie.leftAnchor.constraint(equalTo: self.bottomView.leftAnchor, constant: 12),
            self.nameMovie.bottomAnchor.constraint(equalTo: self.bottomView.bottomAnchor)
        ])
    }
    
    private func setupFavoriteButtonConstraints() {
        NSLayoutConstraint.activate([
            self.favorite.centerYAnchor.constraint(equalTo: self.bottomView.centerYAnchor),
            self.favorite.leftAnchor.constraint(equalTo: self.nameMovie.rightAnchor, constant: 20),
            self.favorite.rightAnchor.constraint(equalTo: self.bottomView.rightAnchor, constant: -10),
            self.favorite.heightAnchor.constraint(equalToConstant: 26),
            self.favorite.widthAnchor.constraint(equalToConstant: 26)
        ])
        self.favorite.tintColor = .yellow
        self.favorite.addTarget(self, action: #selector(MovieCollectionViewCell.favoriteMovie), for: .touchUpInside)
    }
    
    @objc private func favoriteMovie() {
        self.movie = MovieViewModel.favoriteMovie(by: self.movie.id)
        self.delegate.updateFavoriteMovies()
        self.favorite.setImage(self.movie.favorite ? Asset.icStarFull.image : Asset.icStar.image, for: .normal)
    }
}
