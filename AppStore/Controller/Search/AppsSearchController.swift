//
//  AppsSearchController.swift
//  AppStore
//
//  Created by Harry on 09/02/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchController: BaseListController {
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = "Please enter search term above..."
        return label
    }()

    fileprivate let cellId = "SearchResultcell"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate var appResults = [Result]()
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(SearchResultcell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
        setupSearchBar()
    }
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    fileprivate func fetchITunesApps(searchTerm: String) {
        Service.shared.fetchApps(searchTerm: searchTerm) { (res, err) in
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            
            self.appResults = res?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultcell
        cell.appResult = appResults[indexPath.item]
        
        return cell
    }
    
}

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
}

extension AppsSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.fetchITunesApps(searchTerm: searchText)
        })
        
    }
}
