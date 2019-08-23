//
//  GridViewModel.swift
//  Projet4
//
//  Created by Damien Rojo on 02/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

final class GridViewModel {
    
    enum Spot {
        case top, topLeft, topRight, bottom, bottomLeft, bottomRight
    }
    
     // Mark: - Outputs
    
    var selectedSpot: ((Spot) -> Void)?
    
     // Mark: - Inputs
    
    func didSelectSpot(at index: Int) {
        
    }
}
