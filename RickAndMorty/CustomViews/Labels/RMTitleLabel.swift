//
//  RMTitleLabel.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit

class RMTitleLabel: UILabel {
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat, textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize,weight: .bold)
        self.textAlignment = textAlignment
        configure()
    }
    
    //MARK: - Configure Label
    private func configure() {
        textColor = .label
        numberOfLines = 3
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
