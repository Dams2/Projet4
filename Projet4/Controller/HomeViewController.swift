//
//  HomeViewController.swift
//  Projet4
//
//  Created by Damien Rojo on 02/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // Mark: - Outlets
    
    @IBOutlet private  weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont(name: "ThirstySoftRegular", size: 30.0)
            titleLabel.textColor = UIColor.white
        }
    }
    
    @IBOutlet weak var directionLabel: UILabel! {
        didSet {
            directionLabel.font = UIFont(name: "Arial", size: 50.0)
            directionLabel.textColor = UIColor.white
        }
    }
    
    @IBOutlet weak var swipeDirectionLabel: UILabel! {
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

    // Mark: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    private func bind(to viewModel: HomeViewModel) {
        
//        viewModel.titleText = { [weak self] in text
//            self?.titleLabel.text = text
//        }
//
//        viewModel.SwipeDirectionText = { [weak self] in text
//            self?.swipeDirectionLabel = text
//        }
//
//        viewModel.directionText = { [weak self] in text
//            self?.directionLabel = text
//        }
    }
    
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
