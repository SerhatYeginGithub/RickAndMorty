//
//  RMAvatarImageView.swift
//  RickAndMorty
//
//  Created by serhat on 28.06.2024.
//

import UIKit

class RMAvatarImageView: UIImageView {
    //MARK: - Properties
    let cache = NetworkManager.shared.cache
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configuration()
        
    }
    
//MARK: - UI Configuration Functions
    private func configuration(){
        layer.cornerRadius = 16
        clipsToBounds = true
        image = UIImage(named: "logo")
        translatesAutoresizingMaskIntoConstraints = false
    }
    //MARK: - Helper Functions
    func downloadImage(from urlString: String?){
        guard let urlString = urlString else {return}
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            self.image = image
            return
        }
        
        guard let url = URL(string:urlString) else{return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]data, response, error in
            guard let self = self else { return }
            if error != nil {return}
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{return}
            
            guard let data = data else { return }
            guard let image = UIImage(data: data) else {return}
            
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {self.image = image}
            
        }
        task.resume()
    }

}
