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
        self.titleText?("Instagrid")
        self.directionText?("^")
        self.swipeDirectionText?("Swipe-up")
        DispatchQueue.main.async {
            self.selectedConfiguration?(.firstGrid)
        }
    }
    
    func didPressFirstGrid() {
        DispatchQueue.main.async {
            self.selectedConfiguration?(.firstGrid)
        }
    }
    
    func didPressSecondGrid() {
        DispatchQueue.main.async {
            self.selectedConfiguration?(.secondGrid)
        }
    }
    
    func didPressThirdGrid() {
        DispatchQueue.main.async {
            self.selectedConfiguration?(.thirdGrid)
        }
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
