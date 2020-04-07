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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupView() {
        self.title = L10n.Home.title
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.collectionView)
        
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

