//
//  MainScreen.swift
//  lecture17
//
//  Created by MacBook Pro on 14.04.24.
//

import UIKit

class MainScreen: UIViewController {
    
    var collectionView: UICollectionView!
    var addNewCardButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("ახალი ქარდის დამატება", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    var reports =  [ReportData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.image = UIImage(named: "background")
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        setupUI()
        addReportsArray()
    }
    
    func setupUI() {
        setUpCollectionView()
        addNewCardButtonAction()
        addNewCardButtonConstraints()
    }
    
    func setUpCollectionView(){
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .gray
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
    }
    
    func addReportsArray() {
        reports = [
            ReportData(reportIcon: .red,    reportTitle: "ბექა, რას გვერჩი", reportDescription: "ახლა გავხსენი დავალება, ეს რა არის"),
            ReportData(reportIcon: .purple, reportTitle: "რამე სიმღერა მირჩიეთ", reportDescription: "დავალების კეთებისას ღამე ძაან მეძინება, ყავამ არ მიშველა,ახლა გავხსენი დავალება, ეს რა არის!"),
            ReportData(reportIcon: .green,  reportTitle: "ფიგმამ თქვენთ დაგტანჯათ?", reportDescription: "შევწუხდი, დაბალი ხარისხით იწერს ყველას"),
            ReportData(reportIcon: .yellow, reportTitle: "მეტი ბედინა გვინდა", reportDescription: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი"),
        ]
        collectionView.reloadData()
    }
    
    func addNewCardButtonConstraints() {
        view.addSubview(addNewCardButton)
        addNewCardButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addNewCardButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 100),
            addNewCardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addNewCardButton.widthAnchor.constraint(equalToConstant: 300),
            addNewCardButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addNewCardButtonAction() {
        addNewCardButton.addTarget(self, action: #selector(addNewCardButtonTapped), for: .touchUpInside)
    }
    
    @objc func addNewCardButtonTapped() {
        let secondScreen = SecondScreen()
        navigationController?.pushViewController(secondScreen, animated: true)
    }
}

//MARK: extensions

extension MainScreen: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        let currentCell = reports[indexPath.row]
        cell.reportIcon.image = currentCell.reportIcon.image
        cell.reportTitle.text = currentCell.reportTitle
        cell.reportDescription.text = currentCell.reportDescription
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 15
        return cell
    }
}

extension MainScreen: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

