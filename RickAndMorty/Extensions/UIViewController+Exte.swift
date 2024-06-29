//
//  UIViewController+Exte.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit
fileprivate var containerView: UIView!
extension UIViewController {
    //MARK: - Present Alert Function
    func presentRMAlertVC(title: String,message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = RMAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    //MARK: - Activity Indicator Functions
    func showloadingView(){
         containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        UIView.animate(withDuration: 0.1) {containerView.alpha = 0.8}
    
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
        
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    
}
