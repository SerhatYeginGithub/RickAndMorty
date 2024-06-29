//
//  characterCell.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit

class characterCell: UICollectionViewCell {
    //MARK: - Properties
    static  let reusableIdentifier = "CharacterCell"
    //MARK: - UI Elements
    private let nameLabel          = RMBodyLabel(textAlignment: .center)
    private var characterImageView = RMAvatarImageView()
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(){
        super.init(frame: .zero)
        
        configure()
    }
    //MARK: - UI Elements Configure Functions
    private func configure(){
        addSubview(nameLabel)
        addSubview(characterImageView)
        layer.cornerRadius = 20
        layer.borderColor  = UIColor.label.cgColor
        layer.borderWidth  = 2
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 12
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: self.topAnchor,constant: padding),
            characterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            characterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            characterImageView.heightAnchor.constraint(equalToConstant: 100),
            characterImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        ])
    }
    
    func set(item:RMCharacterElement) {
        if let name = item.name {nameLabel.text = name}
        characterImageView.downloadImage(from: item.image)
    }
}
