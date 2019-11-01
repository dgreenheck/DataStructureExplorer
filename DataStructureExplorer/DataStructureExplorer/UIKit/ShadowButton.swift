//
//  ShadowButton.swift
//  DataStructureExplorer
//
//  Created by Daniel Greenheck on 10/31/19.
//  Copyright © 2019 Daniel Greenheck. All rights reserved.
//

import UIKit

@IBDesignable class ShadowButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .systemBlue
        self.titleLabel?.textColor = .white
        self.layer.cornerRadius = self.bounds.height / 8
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius =  2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .init(width: 0, height: 2)
        self.layer.shadowPath = CGPath(rect: self.bounds, transform: nil)
    }
}
