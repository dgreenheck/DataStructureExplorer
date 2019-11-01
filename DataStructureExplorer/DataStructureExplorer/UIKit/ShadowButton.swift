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

        if self.isHighlighted {
            self.backgroundColor = UIColor(red: 0.0/255.0, green: 100.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        }
        else {
            self.backgroundColor = .systemBlue
        }
        
        self.layer.cornerRadius = 8
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius =  2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .init(width: 0, height: 2)
        self.layer.shadowPath = CGPath(rect: self.bounds, transform: nil)
    }
}
