//
//  BackEnabledNavigationController.swift
//  AppStore
//
//  Created by Harry on 07/03/2019.
//  Copyright © 2019 Harry. All rights reserved.
//

import UIKit

class BackEnabledNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count >  1
    }
}
