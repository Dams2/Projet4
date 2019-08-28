//
//  HomeViewModel.swift
//  Projet4
//
//  Created by Damien Rojo on 02/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import Foundation

final class HomeViewModel {
    
    enum PictureConfiguration {
        case firstGrid, secondGrid, thirdGrid
    }
    
    // Mark: - Output
    
    var titleText: ((String) -> Void)?
    var directionText: ((String) -> Void)?
    var swipeDirectionText: ((String) -> Void)?
    var selectedConfiguration: ((PictureConfiguration) -> Void)?
    
    // Mark: - Input
    
    func viewDidLoad() {
        titleText?("Instagrid")
        directionText?("^")
        swipeDirectionText?("Swipe-up")
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
        swipeDirectionText?("Swipe-up to share")
    }
    
    func didChangeToRegular() {
        directionText?("<")
        swipeDirectionText?("Swipe-left to share")
    }
}
