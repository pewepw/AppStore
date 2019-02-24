//
//  ReviewRollCell.swift
//  AppStore
//
//  Created by Harry on 24/02/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

class ReviewRollCell: UICollectionViewCell {
    
    let reviewsController = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(reviewsController.view)
        reviewsController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
