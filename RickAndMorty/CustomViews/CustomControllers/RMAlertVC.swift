//
//  RMAlertVC.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit

class RMAlertVC: UIViewController {
    //MARK: - UI Elements
    let containerView = UIView()
    let actionButton  = RMButton()
    let alertTitleLabel    = RMTitleLabel(fontSize: 25, textAlignment: .center)
    let alertMessageLabel  = RMSecondaryLabel(textAlignment: .center)
    
    //MARK: - Properties
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    let padding: CGFloat = 20
    
    //MARK: - Initializers
    init(alertTitle: String?,message:String?,buttonTitle:String?) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle  = alertTitle
        self.message     = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configure()
    }
    
    //MARK: - UI Elements Configure Functions
    func configure(){
        configureContainerView()
        configureAlertTitleLabel()
        configureAlertMessageLabel()
        configureActionButton()
    }
    
    func configureContainerView(){
        view.addSubview(containerView)
        containerView.addSubview(alertTitleLabel)
        containerView.addSubview(alertMessageLabel)
        containerView.addSubview(actionButton)
        
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 25
        containerView.translatesAutoresizingMaskIntoConstraints     = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 250),
            containerView.widthAnchor.constraint(equalToConstant: 250)
        ])
        
    }
    
    func configureAlertTitleLabel(){
        alertTitleLabel.text = alertTitle ?? "OOPS"
        alertTitleLabel.translatesAutoresizingMaskIntoConstraints   = false
        NSLayoutConstraint.activate([
            alertTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: padding),
            alertTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
            alertTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
        ])
    }
    
    func configureActionButton(){
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.backgroundColor = .systemGreen
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints      = false
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func configureAlertMessageLabel(){
        
        alertMessageLabel.text = message ?? "Something went wrong!"
        alertMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alertMessageLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor, constant: padding),
            alertMessageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
            alertMessageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
        ])
    }
    
    //MARK: - Actions
    @objc func dismissVC(){
        dismiss(animated: true)
    }
    
}
