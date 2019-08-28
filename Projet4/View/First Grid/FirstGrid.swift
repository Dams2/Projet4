//
//  FirstGrid.swift
//  Projet4
//
//  Created by Damien Rojo on 22/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import UIKit

final class FirstGrid: UIView, GridType {
    
    // MARK: - Outlets
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet private weak var bottomPictureView: UIView!
    @IBOutlet private weak var upperLeftPictureView: UIView!
    @IBOutlet private weak var upperRightPictureView: UIView!
    
    @IBOutlet private weak var bottomButton: UIButton!
    @IBOutlet private weak var upperLeftButton: UIButton!
    @IBOutlet private weak var upperRightButton: UIButton!
    
    // MARK: - Properties
    
    private var viewModel: GridViewModel!
    
    private weak var delegate: GridDelegate?

    // Mark: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    private func initialize() {
        Bundle(for: type(of: self)).loadNibNamed(String(describing: FirstGrid.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // Mark: - Action
    
    func set(image: UIImage, for spot: Spot) {
        let imageView = UIImageView(image: image)
        switch spot {
        case .topLeft:
            upperLeftPictureView.removeAllSubviews()
            imageView.frame = upperLeftPictureView.bounds
            upperLeftPictureView.addSubview(imageView)
        case .topRight:
            upperRightPictureView.removeAllSubviews()
            imageView.frame = upperRightPictureView.bounds
            upperRightPictureView.addSubview(imageView)
        case .bottom:
            bottomPictureView.removeAllSubviews()
            imageView.frame = bottomPictureView.bounds
            bottomPictureView.addSubview(imageView)
        default: break
        }
    }
    
    func configure(with viewModelType: GridViewModel, delegate: GridDelegate) {
        self.viewModel = viewModelType
        self.delegate = delegate
        bind(to: self.viewModel)
    }
    
    private func bind(to viewModel: GridViewModel) {
        viewModel.selectedSpot = { [weak self] spot in
            self?.delegate?.didSelect(spot: spot)
        }
    }

    @IBAction func selectSpot(_ sender: UIButton) {
        viewModel.didSelectSpot(at: sender.tag)
    }
}
