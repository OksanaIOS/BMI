//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Vladimir on 25/09/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - UI
    
    private lazy var backgroundImageView: UIImageView  = {
        let element = UIImageView()
        element.image = UIImage(named: "result_background")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private var mainStackView =  UIStackView()
    
    private let recalculateButton = UIButton(isBackgroundWhite: true)
    
    private lazy var titleLabel: UILabel  = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 35, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var resultLabel: UILabel  = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 80, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var descriptionLabel: UILabel  = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 20, weight: .light)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //MARK: - Public Properties
    
    var bmiVaLue: String?
    var advice: String?
    var color: UIColor?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        
        
    }
    
    //MARK: - Set Views
    
    private func setViews() {
        resultLabel.text = bmiVaLue
        descriptionLabel.text = advice
        
        mainStackView = UIStackView(axis: .vertical, distribution: .fillProportionally, subViews: [titleLabel, resultLabel, descriptionLabel])
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        view.addSubview(recalculateButton)
     
        titleLabel.text = "YOUR RESULT"
        resultLabel.text = "19.5"
        descriptionLabel.text = "EAT SOME MORE SNACKS"
        
        view.backgroundColor = .blue
        
        
        recalculateButton.addTarget(self, action: #selector(recalculateButtonTapped), for: .touchUpInside)

    }
    
    @objc private func recalculateButtonTapped() {
        dismiss(animated: true)
        
        
    }
}
extension ResultViewController {
    private func setupConstraints() {
        view.addConstraints([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            recalculateButton.heightAnchor.constraint(equalToConstant: 51),
            recalculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            recalculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
}
//#Preview {
//    ResultViewController()
//}
    
