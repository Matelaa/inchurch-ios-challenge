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
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.title = L10n.Home.title
        self.view.backgroundColor = .white
        
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width == 414 ? 180 : 160,
                      height: UIScreen.main.bounds.size.height == 896 ? 280 : 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as MovieCollectionViewCell
        cell.bind()
        cell.backgroundColor = .blue
        return cell
    }
}

