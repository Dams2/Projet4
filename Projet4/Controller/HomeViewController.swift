//
//  HomeViewController.swift
//  Projet4
//
//  Created by Damien Rojo on 02/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import UIKit

//protocol GridType: class {
//    func set(image: UIImage, for spot: Spot)
//    func configure(with viewModelType: GridViewModel, delegate: GridDelegate)
//}

final class HomeViewController: UIViewController {
    
    // Mark: - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont(name: "ThirstySoftRegular", size: 30.0)
            titleLabel.textColor = UIColor.white
        }
    }
    
    @IBOutlet private weak var directionLabel: UILabel! {
        didSet {
            directionLabel.font = UIFont(name: "Arial", size: 50.0)
            directionLabel.textColor = UIColor.white
        }
    }
    
    @IBOutlet private weak var swipeDirectionLabel: UILabel! {
        didSet {
            swipeDirectionLabel.font = UIFont(name: "Delm-Medium", size: 25.0)
            swipeDirectionLabel.textColor = UIColor.white
        }
    }
  
    @IBOutlet private weak var gridContainer: UIView!
    @IBOutlet private weak var firstGridButton: UIButton!
    @IBOutlet private weak var secondGridButton: UIButton!
    @IBOutlet private weak var thirdGridButton: UIButton!
    
    // Mark: - Private properties
    
    private lazy var viewModel = HomeViewModel()
    
//    private var currentGrid: GridType? {
//        didSet {
//            let viewModel = GridViewModel()
//            self.currentGrid?.configure(with: viewModel, delegate: self)
//        }
//    }
//    private var currentSpot: Spot?
    
    // Mark: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: HomeViewModel) {
        
        viewModel.titleText = { [weak self] text in
            self?.titleLabel.text = text
        }
        
//        viewModel.selectedConfiguration = { [weak self] choice in
//            guard let self = self else { return }
//            switch choice {
//            case .firstGrid:
//                let gridType = FirstGrid()
//                self.configureContainer(for: gridType)
//            case .secondGrid:
//                let gridType = SecondGrid()
//                self.configureContainer(for: gridType)
//            case .thirdGrid:
//                let gridType = ThirdGrid()
//                self.configureContainer(for: gridType)
//            }
//        }

        viewModel.swipeDirectionText = { [weak self] text in
            self?.swipeDirectionLabel.text = text
        }

        viewModel.directionText = { [weak self] text in
            self?.directionLabel.text = text
        }
    }
    
    // Mark: - Helpers
    
//    private func configureContainer(for grid: GridType) {
//        self.currentGrid = grid
//        guard let gridView = grid as? UIView else { return }
//        self.gridContainer.layoutIfNeeded()
//        gridView.frame = gridContainer.bounds
//        self.gridContainer.addSubview(gridView)
//    }
    
    // Mark: - Action
    
    @IBAction func didPressFirstGridButton(_ sender: UIButton) {
        viewModel.didPressFirstGrid()
    }
    
    @IBAction func didPressSecondGridButton(_ sender: UIButton) {
        viewModel.didPressSecondGrid()
    }
    
    @IBAction func didPressThirdGridButton(_ sender: UIButton) {
        viewModel.didPressThirdGrid()
    }
}
