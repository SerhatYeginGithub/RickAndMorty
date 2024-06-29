//
//  EpisodeVC.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit

class EpisodeVC: UITableViewController {
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Episodes"
        view.backgroundColor = .systemBackground
        tableView.rowHeight = 80
        tableView.register(EpisodeCell.self ,forCellReuseIdentifier: EpisodeCell.reusableIdentifier)
    }
}
//MARK: - UITableView DataSource
extension EpisodeVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 51
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numberOfEpisode = indexPath.row + 1
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.reusableIdentifier, for: indexPath) as! EpisodeCell
        cell.episodeLabel.text = "Episode \(numberOfEpisode)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

//MARK: - UITableView Delegate

extension EpisodeVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let episode = "Episode \(indexPath.row + 1)"
        pushEpisodeDetailVC(episode: episode)
    }
    
    func pushEpisodeDetailVC(episode: String){
        let destinationVC = EpisodeDetailVC()
        destinationVC.navigationItem.title = episode
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
