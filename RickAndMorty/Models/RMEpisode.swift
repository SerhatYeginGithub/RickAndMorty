//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import Foundation

// MARK: - RMEpisodeElement
struct RMEpisodeElement: Codable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String
    let characters: [String]?
}

typealias RMEpisode = [RMEpisodeElement]
    
