//
//  TodayItem.swift
//  AppStore
//
//  Created by Harry on 02/03/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

struct TodayItem {
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    //enum
    let cellType: CellType
    
    enum CellType: String {
        case single, multiple
    }
}
