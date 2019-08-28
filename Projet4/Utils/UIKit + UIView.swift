//
//  UIKit + UIView.swift
//  Projet4
//
//  Created by Damien Rojo on 26/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import UIKit

extension UIView {
    
    func removeAllSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
}
