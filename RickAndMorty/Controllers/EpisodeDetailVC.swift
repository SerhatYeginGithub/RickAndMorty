//
//  EpisodeDetailVC.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit

class EpisodeDetailVC: UIViewController {
//MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presentRMAlertVC(title: "OOPS", message: "Sorry! This page is not available.", buttonTitle: "OK")
    }
    
}
