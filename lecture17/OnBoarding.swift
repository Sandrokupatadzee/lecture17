//
//  OnBoarding.swift
//  lecture17
//
//  Created by MacBook Pro on 14.04.24.
//

import UIKit

class OnBoarding: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage(named: "Onboardingbackground")
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        addDescriptionLabel()
        addStartButton()
    }
    
    func addDescriptionLabel() {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "შედი აპლიკაციაში და იწუწუნე რამდენიც გინდა"
        descriptionLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 4
        
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func addStartButton() {
        let nextButton = UIButton()
        nextButton.configuration = .filled()
        nextButton.configuration?.title = "დაწყება"
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 5
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    @objc func nextButtonTapped() {
        let mainScreen = MainScreen()
        navigationController?.pushViewController(mainScreen, animated: true)
    }
    
}

