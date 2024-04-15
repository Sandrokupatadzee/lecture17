//
//  customCell.swift
//  lecture17
//
//  Created by MacBook Pro on 14.04.24.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    let reportTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reportDescription: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 15
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reportIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupUI() {
        addSubview(reportTitle)
        addSubview(reportDescription)
        addSubview(reportIcon)
        
        NSLayoutConstraint.activate([
            reportIcon.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            reportIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            reportIcon.widthAnchor.constraint(equalToConstant: 40),
            reportIcon.heightAnchor.constraint(equalToConstant: 40),

            reportTitle.topAnchor.constraint(equalTo: reportIcon.bottomAnchor, constant: 10),
            reportTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            reportTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            reportDescription.topAnchor.constraint(equalTo: reportTitle.bottomAnchor, constant: 10),
            reportDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            reportDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
