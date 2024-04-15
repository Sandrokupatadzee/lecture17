//
//  SecondScreen.swift
//  lecture17
//
//  Created by MacBook Pro on 14.04.24.
//

import UIKit

class SecondScreen: UIViewController {
    
    var addReportTitle: UITextField!
    var addLogInDescription: UITextField!
    var selectedIcon: Icon?
    
    var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("დამატება", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage(named: "background")
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        addLogInStackView()
        addIconStackView()
        addButtonConstraints()
        addButtonAction()
    }
    
    func addLogInStackView() {
        
        let logInReport = UILabel()
        logInReport.text = "სათაური"
        logInReport.font = UIFont.systemFont(ofSize: 13, weight: .light)
        logInReport.textColor = .white
        
        addReportTitle = UITextField()
        addReportTitle.backgroundColor = .clear
        addReportTitle.layer.cornerRadius = 5
        addReportTitle.layer.borderWidth = 1
        addReportTitle.layer.borderColor = UIColor.gray.cgColor
        addReportTitle.font = UIFont.systemFont(ofSize: 17, weight: .light)
        addReportTitle.textColor = .lightGray
        addReportTitle.attributedPlaceholder = NSAttributedString(
            string: "მაგ: პანიკა, დახმარება მჭირდება!",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        let logInReportStackView = UIStackView(arrangedSubviews: [logInReport, addReportTitle])
        logInReportStackView.axis = .vertical
        logInReportStackView.spacing = 8
        
        let logInDescription = UILabel()
        logInDescription.text = "აღწერა"
        logInDescription.font = UIFont.systemFont(ofSize: 13, weight: .light)
        logInDescription.textColor = .white
        
        addLogInDescription = UITextField()
        addLogInDescription.backgroundColor = .clear
        addLogInDescription.layer.cornerRadius = 5
        addLogInDescription.layer.borderWidth = 1
        addLogInDescription.layer.borderColor = UIColor.gray.cgColor
        addLogInDescription.font = UIFont.systemFont(ofSize: 17, weight: .light)
        addLogInDescription.textColor = .lightGray
        addLogInDescription.attributedPlaceholder = NSAttributedString(
            string: "მაგ: ფიგმამ გაჭედა და ვინმემ გამომიგზავნეთ",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        
        let addLogInDescriptionStackView = UIStackView(arrangedSubviews: [logInDescription, addLogInDescription])
        addLogInDescriptionStackView.axis = .vertical
        addLogInDescriptionStackView.spacing = 8
        
        let logInIReportStackView = UIStackView(arrangedSubviews: [logInReportStackView, addLogInDescriptionStackView])
        logInIReportStackView.axis = .vertical
        logInIReportStackView.spacing = 8
        logInIReportStackView.distribution = .fillEqually
        view.addSubview(logInIReportStackView)
        logInIReportStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logInIReportStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logInIReportStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            logInIReportStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
    }
    
    func addIconStackView() {
        let redButton = createIconButton(named: "redicon")
        let greenButton = createIconButton(named: "greenicon")
        let purpleButton = createIconButton(named: "purpleicon")
        let yellowButton = createIconButton(named: "yellowicon")
        
        let iconStackView = UIStackView(arrangedSubviews: [redButton, greenButton, purpleButton, yellowButton])
        iconStackView.axis = .horizontal
        iconStackView.distribution = .fillEqually
        iconStackView.spacing = 8
        
        view.addSubview(iconStackView)
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            iconStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            iconStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            iconStackView.heightAnchor.constraint(equalToConstant: 60),

        ])
    }
    
    private func createIconButton(named iconName: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: iconName), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc func iconButtonTapped(_ sender: UIButton) {
        var selectedIcon: Icon?
        
        for subview in sender.superview?.subviews ?? [] {
            if let button = subview as? UIButton {
                button.backgroundColor = .clear
            }
        }
        
        sender.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        
        if sender.image(for: .normal) == UIImage(named: "redicon") {
            selectedIcon = .red
        } else if sender.image(for: .normal) == UIImage(named: "greenicon") {
            selectedIcon = .green
        } else if sender.image(for: .normal) == UIImage(named: "purpleicon") {
            selectedIcon = .purple
        } else if sender.image(for: .normal) == UIImage(named: "yellowicon") {
            selectedIcon = .yellow
        }
        
        if let icon = selectedIcon {
            self.selectedIcon = icon
        }
    }
    
    func addButtonConstraints() {
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 300),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addButtonAction() {
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func addButtonTapped() {
        guard let selectedIcon = selectedIcon else {
            let alertController = UIAlertController(title: "Error", message: "გთხოვთ მიუთითეთ აიქონი.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return
        }
        
        guard let reportTitle = addReportTitle.text, let reportDescription = addLogInDescription.text else { return }
        
        let newReport = ReportData(reportIcon: selectedIcon, reportTitle: reportTitle, reportDescription: reportDescription)

        if let mainScreen = navigationController?.viewControllers.first as? MainScreen {
            mainScreen.reports.append(newReport)
            mainScreen.collectionView.reloadData()
        }
        
        let alert = UIAlertController(title: "Success", message: "ქარდი წარმატებით დაემატა.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
}
