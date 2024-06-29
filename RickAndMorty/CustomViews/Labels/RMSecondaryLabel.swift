//
//  RMSecondaryLabel.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit

class RMSecondaryLabel: UILabel {
    
//MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    //MARK: - Configure Label
    private func configure(){
        textColor = .label
        font      = UIFont.preferredFont(forTextStyle: .body)
        numberOfLines = 4
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
