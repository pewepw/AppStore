//
//  BaseListController.swift
//  AppStore
//
//  Created by Harry on 17/02/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
