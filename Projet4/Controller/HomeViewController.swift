//
//  HomeViewController.swift
//  Projet4
//
//  Created by Damien Rojo on 02/08/2019.
//  Copyright © 2019 damien. All rights reserved.
//

import UIKit

protocol GridType: class {
    func set(image: UIImage, for spot: Spot)
    func configure(with viewModelType: GridViewModel, delegate: GridDelegate)
}

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
            directionLabel.font = UIFont(name: "Arial", size: 40.0)
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

    private lazy var pickerController: UIImagePickerController = {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = false
        return pickerController
    }()

    private lazy var leftSwipeGestureRecognizer: UISwipeGestureRecognizer = {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(executeSwipeAction(_:)))
        swipeGesture.direction = .left
        return swipeGesture
    }()

    private lazy var upSwipeGestureRecognizer: UISwipeGestureRecognizer = {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(executeSwipeAction(_:)))
        swipeGesture.direction = .up
        return swipeGesture
    }()

    private var currentGrid: GridType? {
        didSet {
            let viewModel = GridViewModel()
            self.currentGrid?.configure(with: viewModel, delegate: self)
        }
    }

    private var currentSpot: Spot?

    // Mark: - View life cycle

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    // refactoriser
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureLayout()
    }

    private func bind(to viewModel: HomeViewModel) {

        viewModel.titleText = { [weak self] text in
            self?.titleLabel.text = text
        }

        viewModel.selectedConfiguration = { [weak self] choice in
            guard let self = self else { return }
            self.removeSelectedViews()

            switch choice {
            case .firstGrid:
                let gridType = FirstGrid()
                self.configureContainer(for: gridType)
                self.setSelectedView(on: self.firstGridButton)
            case .secondGrid:
                let gridType = SecondGrid()
                self.configureContainer(for: gridType)
                self.setSelectedView(on: self.secondGridButton)
            case .thirdGrid:
                let gridType = ThirdGrid()
                self.configureContainer(for: gridType)
                self.setSelectedView(on: self.thirdGridButton)
            }
        }
        viewModel.swipeDirectionText = { [weak self] text in
            self?.swipeDirectionLabel.text = text
        }
        viewModel.directionText = { [weak self] text in
            self?.directionLabel.text = text
        }
    }

    // Mark: - Helpers

    @objc func executeSwipeAction(_ sender: UISwipeGestureRecognizer) {
        DispatchQueue.main.async {
            UIView.transition(with: self.gridContainer,
                              duration: 0.8,
                              options: sender.direction == .left ? [.transitionCrossDissolve] : [.transitionCurlUp],
                              animations: {},
                              completion: { [weak self] _ in self?.sharePicture() })
        }
    }

    private func sharePicture() {
        UIGraphicsBeginImageContext(gridContainer.frame.size)
        gridContainer.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        let activityVC = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        activityVC.completionWithItemsHandler = { _, completed, _, _ in
            if completed {
                self.viewModel.didClearGrid()
            }
        }
        self.present(activityVC, animated: true, completion: nil)
    }

    private func configureContainer(for grid: GridType) {
        self.currentGrid = grid
        guard let gridView = grid as? UIView else { return }
        self.gridContainer.removeAllSubviews()
        self.gridContainer.layoutIfNeeded()
        self.gridContainer.addSubview(gridView)
        self.makeConstraints(for: gridView, with: gridContainer)
    }

    private func makeConstraints(for view1: UIView, with view2: UIView) {
        view1.translatesAutoresizingMaskIntoConstraints = false // On enleve l'autolayout du storyboard
        // On remet les contrainte par le code
        NSLayoutConstraint.activate([
            view1.leftAnchor.constraint(equalTo: view2.leftAnchor),
            view1.rightAnchor.constraint(equalTo: view2.rightAnchor),
            view1.bottomAnchor.constraint(equalTo: view2.bottomAnchor),
            view1.topAnchor.constraint(equalTo: view2.topAnchor)
        ])
    }

    private func removeSelectedViews() {
        firstGridButton.subviews.forEach { $0.removeImageView(with: "Selected") }
        secondGridButton.subviews.forEach { $0.removeImageView(with: "Selected") }
        thirdGridButton.subviews.forEach { $0.removeImageView(with: "Selected") }
    }

    private func setSelectedView(on button: UIButton) {
        let image = UIImage(named: "Selected")
        let imageView = UIImageView(image: image)
        imageView.frame = button.bounds
        button.addSubview(imageView)
    }

    // Mark: - Trait Collection

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        configureLayout()
    }
    
    private func configureLayout() {
        gridContainer.gestureRecognizers?.removeAll()
        if traitCollection.horizontalSizeClass == .compact, UIDevice.current.orientation == .portrait {
            gridContainer.addGestureRecognizer(upSwipeGestureRecognizer)
            viewModel.didChangeToCompact()
        } else {
            gridContainer.addGestureRecognizer(leftSwipeGestureRecognizer)
            viewModel.didChangeToRegular()
        }

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

extension HomeViewController: GridDelegate {
    func didSelect(spot: Spot) {
        self.currentSpot = spot
        DispatchQueue.main.async {
            self.show(self.pickerController, sender: nil)
        }
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage, let spot = currentSpot {
            self.currentGrid?.set(image: image, for: spot)
        }
        self.dismiss(animated: true, completion: nil)
    }
}

extension UIView {
    func removeImageView(with name: String) {
        if let view = self as? UIImageView, view.image == UIImage(named: name) {
            view.removeFromSuperview()
        }
    }
}
