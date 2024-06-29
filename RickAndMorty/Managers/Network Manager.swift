//
//  Network Manager.swift
//  RickAndMorty
//
//  Created by serhat on 27.06.2024.
//

import UIKit

class NetworkManager {
    //MARK: - Properties
    static  let shared  = NetworkManager()
    private let baseUrl   = "https://rickandmortyapi.com/api/character/"
    private let episodeBaseUrl = "https://rickandmortyapi.com/api/episode/"
    let cache = NSCache<NSString,UIImage>()
    //MARK: - Initializers
    private init() {}
    
    //MARK: - Methods
    func getCharacters(page: Int, completed: @escaping(Result<[RMCharacterElement],RMError>)-> Void){
        
        let endPoint = baseUrl + calculateId(id: page)
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let characters = try decoder.decode(RMCharacter.self, from: data)
                completed(.success(characters))
            } catch {
                print(error)
                completed(.failure(.invalidData))
            }
            
        }
        task.resume()
       
    }
    
    func getEpisodes(completed: @escaping(Result<RMEpisode,RMError>)-> Void){
        
        let endPoint = episodeBaseUrl + calculateEpisodeId()
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let episodes = try decoder.decode(RMEpisode.self, from: data)
                completed(.success(episodes))
            } catch {
                print(error)
                completed(.failure(.invalidData))
            }
            
        }
        task.resume()
       
    }
    
    
    
     func calculateId(id:Int)->String{
         let firstId = id == 1 ? id : id + 1
        let lastId  = id + 30

        var ids          = ""
        for i in firstId...lastId {
            if ids.isEmpty{
                ids = "\(i)"
            } else {
                ids += ",\(i)"
            }
        }
        return ids
    }
    
    func calculateEpisodeId()->String{
        let firstId = 1
        let lastId  = 51
        var ids = ""
        for i in firstId...lastId {
            if ids.isEmpty{
                ids = "\(i)"
            } else {
                ids += ",\(i)"
            }
        }
        return ids
    }
}
