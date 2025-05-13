//
//  dealVC.swift
//  TravelApp
//
//  Created by hady ka on 13/05/2025.
//

import UIKit

    class dealVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

        private var deals: [Deal] = [
          
            Deal(destination: "Paris", price: "$799", imageName: "paris", systemIconName: "airplane"),
            Deal(destination: "Tokyo", price: "$999", imageName: "tokyo", systemIconName: "globe.asia.australia"),
            Deal(destination: "New York", price: "$499", imageName: "newyork", systemIconName: "building.2"),
            Deal(destination: "London", price: "$599", imageName: "london", systemIconName: "tram"),
            Deal(destination: "Rome", price: "$699", imageName: "rome", systemIconName: "camera")
        ]

        private var collectionView: UICollectionView!

        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Travel Deals"
            view.backgroundColor = .systemBackground
            setupCollectionView()
        }

        private func setupCollectionView() {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            layout.minimumLineSpacing = 16

            collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
            collectionView.register(DealCollectionViewCell.self, forCellWithReuseIdentifier: DealCollectionViewCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = .systemBackground
            collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            view.addSubview(collectionView)
        }

        // MARK: - UICollectionView DataSource

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return deals.count
        }

        func collectionView(_ collectionView: UICollectionView,
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DealCollectionViewCell.identifier, for: indexPath) as! DealCollectionViewCell
            cell.configure(with: deals[indexPath.row])
            return cell
        }

        // MARK: - UICollectionViewDelegateFlowLayout

        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width - 32
            return CGSize(width: width, height: 220)
        }
    }
