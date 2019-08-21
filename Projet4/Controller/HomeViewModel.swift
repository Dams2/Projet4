//
//  HomeViewModel.swift
//  Projet4
//
//  Created by Damien Rojo on 02/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

final class HomeViewModel {
    
    enum pictureConfiguration {
        case firstGrid, secondGrid, thirdGrid
    }
    
    // Mark: - Output
    
    var titleText: ((String) -> Void)?
    var directionText: ((String) -> Void)?
    var SwipeDirectionText: ((String) -> Void)?
    var selectedConfiguration: ((pictureConfiguration) -> Void)?
    
    // Mark: - Input
    
    func viewDidLoad() {
        titleText?("Instagrid")
        directionText?("^")
        SwipeDirectionText?("Swipe-up")
        selectedConfiguration?(.firstGrid)
    }
    
    func didPressFirstGrid() {
        selectedConfiguration?(.firstGrid)
    }
    
    func didPressSecondGrid() {
        selectedConfiguration?(.secondGrid)
    }
    
    func didPressThirdGrid() {
        selectedConfiguration?(.thirdGrid)
    }
    
    func didChangeToCompact() {
        directionText?("^")
        SwipeDirectionText?("Swipe-up to share")
    }
    
    func didChangeToRegular() {
        directionText?("<")
        SwipeDirectionText?("Swipe-left to share")
    }
}
