//
//  MovieCollectionViewCell.swift
//  inchurch-ios-challenge
//
//  Created by matela on 08/04/20.
//  Copyright © 2020 José Matela Neto. All rights reserved.
//

import UIKit
import Reusable

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
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(movie: MovieView) {
        self.nameMovie.text = movie.title
    }
    
    private func configureCell() {
        self.addSubview(self.view)
        self.view.addSubview(self.pictureMovie)
        self.view.addSubview(self.bottomView)
        self.bottomView.addSubview(self.nameMovie)
        
        self.setupViewConstraints()
        self.setupPictureMovieConstraints()
        self.setupBottomViewConstraints()
        self.setupNameMovieConstraints()
    }
    
    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.topAnchor),
            self.view.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.view.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        self.view.backgroundColor = .green
    }
    
    private func setupPictureMovieConstraints() {
        NSLayoutConstraint.activate([
            self.pictureMovie.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.pictureMovie.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.pictureMovie.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.pictureMovie.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.pictureMovie.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        self.pictureMovie.backgroundColor = .orange
    }

    private func setupBottomViewConstraints() {
        NSLayoutConstraint.activate([
            self.bottomView.heightAnchor.constraint(equalToConstant: 40),
            self.bottomView.widthAnchor.constraint(equalToConstant: self.frame.width),
            self.bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        self.bottomView.backgroundColor = .red
    }
    
    private func setupNameMovieConstraints() {
        NSLayoutConstraint.activate([
//            self.nameMovie.centerXAnchor.constraint(equalTo: self.bottomView.centerXAnchor),
            self.nameMovie.centerYAnchor.constraint(equalTo: self.bottomView.centerYAnchor),
            self.nameMovie.leftAnchor.constraint(equalTo: self.bottomView.leftAnchor, constant: 12),
            self.nameMovie.rightAnchor.constraint(equalTo: self.bottomView.rightAnchor),
            self.nameMovie.bottomAnchor.constraint(equalTo: self.bottomView.bottomAnchor)
        ])
    }
}
