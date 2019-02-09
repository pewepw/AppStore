//
//  AppsSearchController.swift
//  AppStore
//
//  Created by Harry on 09/02/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppsSearchController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .red
        
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
