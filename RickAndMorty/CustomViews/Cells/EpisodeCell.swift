//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit

class EpisodeCell: UITableViewCell {
    //MARK: - Properties
    static let reusableIdentifier = "Episode Cell"
    
    //MARK: - UI Elements
    let avatarImageView = RMAvatarImageView()
    let episodeLabel    = RMTitleLabel(fontSize: 20, textAlignment: .left)
    
  //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - UI Elements Configuration
    private func configuration() {
        self.addSubview(avatarImageView)
        self.addSubview(episodeLabel)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        episodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            avatarImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            avatarImageView.widthAnchor.constraint(equalTo:avatarImageView.heightAnchor ,constant: 55),
            
            episodeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: padding),
            episodeLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            episodeLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            episodeLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }

}
