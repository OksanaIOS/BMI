//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UI
    
    private lazy var backgroundImageView: UIImageView  = {
        let element = UIImageView()
        element.image = UIImage(named: "calculate_background")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView =  UIStackView()
    
    private var heightStackView = UIStackView()
    private let heightTitleLabel = UILabel(alignment: .left)
    private let heightNumberLabel = UILabel(alignment: .right)
    private let heightSlider = UISlider(maxValue: 3)
    
    private var weightStackView = UIStackView()
    private let weightTitleLabel = UILabel(alignment: .left)
    private let weightNumberLabel = UILabel(alignment: .right)
    private let weightSlider = UISlider(maxValue: 300)
    
    private lazy var titleLabel: UILabel  = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 40, weight: .bold)
        element.textColor = .darkGray
        element.textAlignment = .left
        element.numberOfLines = 0
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var calculateButton = UIButton(isBackgroundWhite: false)
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    
    }
    private func setViews() {
        heightStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subViews: [heightTitleLabel, heightNumberLabel])
        weightStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subViews: [weightTitleLabel, weightNumberLabel])
        mainStackView = UIStackView(axis: .vertical, distribution: .fillProportionally, subViews: [titleLabel, heightStackView, heightSlider, weightStackView, weightSlider, calculateButton])
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
     
        titleLabel.text = "CALCULATE YOUR BMI"
        
        heightTitleLabel.text = "Height"
        heightNumberLabel.text = "1.5 m"
        
        weightTitleLabel.text = "Weight"
        weightNumberLabel.text = "100 kg"
        
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)

    }
    @objc private func calculateButtonTapped() {
        print("tap")
    }


}

extension ViewController {
    private func setupConstraints() {
        view.addConstraints([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            heightStackView.heightAnchor.constraint(equalToConstant: 21),
            heightSlider.heightAnchor.constraint(equalToConstant: 60),
        
            weightStackView.heightAnchor.constraint(equalToConstant: 21),
            weightSlider.heightAnchor.constraint(equalToConstant: 60),
            
            calculateButton.heightAnchor.constraint(equalToConstant: 51)
        
        ])
        
    }
    
}
extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, subViews: [UIView]) {
        self.init(arrangedSubviews: subViews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = 0
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
}
extension UILabel {
    convenience init(alignment: NSTextAlignment) {
        self.init()
        self.textAlignment = alignment
        self.font = .systemFont(ofSize: 17, weight: .light)
        self.textColor = .darkGray
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
}
extension UISlider {
    convenience init(maxValue: Float) {
        self.init()
        
        self.maximumValue = maxValue
        self.value = maxValue / 2
        self.thumbTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.minimumTrackTintColor = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 0.5)
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
}
extension UIButton {
    convenience init(isBackgroundWhite: Bool) {
        self.init(type: .system)
        let color = UIColor(red: 0.45, green: 0.45, blue: 0.82, alpha: 1.00)
        let text = isBackgroundWhite ? "RECALCULATE" : "CALCULATE"
        self.tintColor = isBackgroundWhite ? color : .white
        self.backgroundColor = isBackgroundWhite ? .white : color
        self.layer.cornerRadius = 10
        self.titleLabel?.font = .systemFont(ofSize: 20)
        self.setTitle(text, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}




#Preview {
    ViewController()
}


