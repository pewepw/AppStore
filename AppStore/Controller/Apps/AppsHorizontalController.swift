//
//  AppsHorizontalController.swift
//  AppStore
//
//  Created by Harry on 17/02/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

class AppsHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    var appGroup: AppGroup?
    var didSelectHandler: ((FeedResult) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        //Deprecated because refactor to base class HorizontalSnappingController
//        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppRowCell
        let app = appGroup?.feed.results[indexPath.item]
        cell.companyLabel.text = app?.name
        cell.nameLabel.text = app?.artistName
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""), completed: nil)
        return cell
    }
    
    let topBottomPadding: CGFloat = 12
    let spacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - (2 * topBottomPadding) - (2 * spacing)) / 3
        return CGSize(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topBottomPadding, left: 0, bottom: topBottomPadding, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appGroup?.feed.results[indexPath.item] {
            didSelectHandler?(app)
        }
    }
}
