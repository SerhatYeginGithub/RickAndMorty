//
//  CharacterDetailVCViewController.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit

class CharacterDetailVC: UIViewController {
    //MARK: - UI Elements
    let characterImageView = RMAvatarImageView()
    let nameLabel          = RMBodyLabel(textAlignment: .left)
    let speciesLabel       = RMBodyLabel(textAlignment: .left)
    let genderLabel        = RMBodyLabel(textAlignment: .left)
    let originLabel        = RMBodyLabel(textAlignment: .left)
    let locationLabel      = RMBodyLabel(textAlignment: .left)
    let statusLabel        = RMBodyLabel(textAlignment: .left)
    let episodeCountLabel  = RMBodyLabel(textAlignment: .left)
    let stackView          = UIStackView()
    var subViews: [UIView] = []
    //MARK: - Properties
    var characterInfo: RMCharacterElement?
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configuration()
        set(characterInfo: characterInfo)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if characterInfo != nil {
            navigationItem.title = characterInfo?.name
        }
        
    }
    //MARK: - UI Elements Configuration Functions
    private func configuration() {
        view.addSubview(stackView)
        view.addSubview(characterImageView)
        makeTranslateAutoFalse()
        configurationStackView()
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            characterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            characterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor, multiplier: 1.0),
            stackView.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
    
    func configurationStackView(){
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(speciesLabel)
        stackView.addArrangedSubview(statusLabel)
        stackView.addArrangedSubview(genderLabel)
        stackView.addArrangedSubview(originLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(episodeCountLabel)
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .systemBackground
    }
    
    func makeTranslateAutoFalse(){
        subViews = [characterImageView,nameLabel,speciesLabel,genderLabel,originLabel,locationLabel,statusLabel,episodeCountLabel,stackView]
        for view in subViews {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    //MARK: - Helper Functions
    func set(characterInfo: RMCharacterElement?){
        if let characterInfo = characterInfo {
            characterImageView.downloadImage(from: characterInfo.image)
            
            if let name = characterInfo.name,
               let species = characterInfo.species,
               let gender = characterInfo.gender,
               let status = characterInfo.status,
               let origin = characterInfo.origin?.name,
               let episode = characterInfo.episode?.count,
               let location = characterInfo.location?.name{
                nameLabel.text     = "Name    : \(name)"
                speciesLabel.text  = "Species : \(species)"
                statusLabel.text   = "Status  : \(status)"
                genderLabel.text   = "Gender  : \(gender)"
                originLabel.text   = "Origin  : \(origin)"
                episodeCountLabel.text = "Episode count : \(episode)"
                locationLabel.text = "Location: \(location)"
            }
        }
    }
}

