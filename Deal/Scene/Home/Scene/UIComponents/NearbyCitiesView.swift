//
//  NearbyCitiesView.swift
//  Deal
//
//  Created by Pierre Doury on 01/10/2022.
//

import Foundation
import UIKit

// TODO: create init with custom data
class NearbyCitiesView: UIView {
    
    private var pinImage = UIImageView()
    private var titleLabel = UILabel()
    
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
        
        pinImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Geneva"
        NSLayoutConstraint.activate([
            pinImage.topAnchor.constraint(equalTo: self.topAnchor),
            pinImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pinImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            pinImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}
