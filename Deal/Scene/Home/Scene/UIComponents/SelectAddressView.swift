//
//  SelectAdressView.swift
//  Deal
//
//  Created by Pierre Doury on 30/09/2022.
//

import Foundation
import UIKit

// TODO: create init with custom data
class SelectAddressView: UIView {
    
    private var pinImage = UIImageView()
    private var titleLabel = UILabel()
    private var descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pinImage)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        pinImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        pinImage.image = UIImage(systemName: "map.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        titleLabel.text = "Hungry? We deliver"
        descriptionLabel.text = "Tap here to select an adress"
        self.backgroundColor = UIColor(named: "backgroundRed")
        NSLayoutConstraint.activate([
            pinImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pinImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
//            pinImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
//            pinImage.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            pinImage.widthAnchor.constraint(equalToConstant: 20),
            pinImage.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: pinImage.trailingAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -2),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: pinImage.trailingAnchor, constant: 8),
            descriptionLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 2),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 8)
        ])
    }
}

