//
//  PropertiesViewController.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import UIKit


class PropertiesViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Properties
    var properties: [Property] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: UIViewController Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getAdsData()
    }
    
}

// MARK: UICollectionViewDataSource && UICollectionViewDelegateFlowLayout Methods
extension PropertiesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return properties.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyCollectionViewCell", for: indexPath) as! PropertyCollectionViewCell
        cell.property = properties[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 230)
    }
    
}

// MARK: Network Calls
extension PropertiesViewController {
    
    func getAdsData() {
        showLoader()
        let params: HttpParameters = [
            "page":"2",
            "per_page": "100",
            "sort_by": "date",
            "sort_type":"asc",
            "distance":"2000",
            "point_search":"43.6964,7.2716"
        ]
        
        NetworkManager.getAds(with: params) { [weak self] (response, error) in
            guard let weakSelf = self else { return }
            weakSelf.hideLoader()
            if let response = response {
                weakSelf.properties = response.properties ?? []
            }
            else {
                weakSelf.showMessage("", message: error ?? "SOMETHING_WENT_WRONG".localize())
            }
        }
        
    }
}
