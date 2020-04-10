//
//  FavoritesTableViewCell.swift
//  inchurch-ios-challenge
//
//  Created by matela on 10/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class FavoritesTableViewCell: UITableViewCell, Reusable {

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
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        return label
    }()
    
    private let releaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private let overview: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    var movie: MovieView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(movie: MovieView) {
        self.movie = movie
        self.pictureMovie.setImage(movie.imageUrl)
        self.title.text = movie.title
        self.releaseDate.text = movie.releaseDate
        self.overview.text = movie.overview
    }
    
    private func setupCell() {
        self.addSubview(self.view)
        self.view.addSubview(self.pictureMovie)
        self.view.addSubview(self.title)
        self.view.addSubview(self.releaseDate)
        self.view.addSubview(self.overview)
        
        self.setupViewConstraints()
        self.setupPictureMovieConstraints()
        self.setupTitleConstraints()
        self.setupReleaseDateConstraints()
        self.setupOverviewConstraints()
        
        self.backgroundColor = .black
    }
    
    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            self.view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2),
            self.view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6)
        ])
    }
    
    private func setupPictureMovieConstraints() {
        NSLayoutConstraint.activate([
            self.pictureMovie.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.pictureMovie.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.pictureMovie.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.pictureMovie.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupTitleConstraints() {
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8),
            self.title.leftAnchor.constraint(equalTo: self.pictureMovie.rightAnchor, constant: 6),
            self.title.widthAnchor.constraint(equalToConstant: 160),
        ])
    }
    
    private func setupReleaseDateConstraints() {
        NSLayoutConstraint.activate([
            self.releaseDate.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8),
            self.releaseDate.leftAnchor.constraint(equalTo: self.title.rightAnchor, constant: 2),
            self.releaseDate.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -6)
        ])
    }
    
    private func setupOverviewConstraints() {
        NSLayoutConstraint.activate([
            self.overview.heightAnchor.constraint(equalToConstant: 100),
            self.overview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.overview.leftAnchor.constraint(equalTo: self.pictureMovie.rightAnchor, constant: 6),
            self.overview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -2)
        ])
    }
}
