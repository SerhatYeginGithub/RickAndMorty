//
//  ViewController.swift
//  RickAndMorty
//
//  Created by serhat on 27.06.2024.
//

import UIKit

class CharacterVC: UIViewController {
    
    //MARK: - UI Elements
    var collectionView: UICollectionView!
    //MARK: - Properties
    var characters: RMCharacter         = []
    var filteredCharacters: RMCharacter = []
    var isSearching                     = false
    var characterIdFirst                = 1
    var hasMoreCharacter                = true
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationViewController()
        configurationCollectionView()
        getCharactersInfo(id: characterIdFirst)
    }
    //MARK: - UI Elements Configuration Functions
    func configurationViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureSearchController()
        navigationItem.title = "Characters"
    }
    
    func configureSearchController(){
        let searchController =  UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a character name"
        navigationItem.searchController = searchController
    }
    
    func configurationCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        collectionView.dataSource = self
        collectionView.delegate   = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(characterCell.self, forCellWithReuseIdentifier: characterCell.reusableIdentifier)
        view.addSubview(collectionView)
    }
    
    //MARK: - Helper Functions
    
    func getCharactersInfo(id:Int){
        DispatchQueue.main.async {self.showloadingView()}
        NetworkManager.shared.getCharacters(page: id) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let success):
               hasMoreCharacter =  success.count<30 ?  false : true
                self.characters.append(contentsOf: success)
                self.dismissLoadingView()
                DispatchQueue.main.async{self.collectionView.reloadData()}
            case .failure(let failure):
                print(failure.rawValue)
                self.dismissLoadingView()
                self.presentRMAlertVC(title: "Something went wrong!", message: failure.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func pushDetailVC(characterInfo:RMCharacterElement){
        let destinationVC = CharacterDetailVC()
        destinationVC.characterInfo = characterInfo
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}

//MARK: - UICollectionView Delegate
extension CharacterVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let indexCount = isSearching ? filteredCharacters.count : characters.count
        return indexCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let character = isSearching ? filteredCharacters[indexPath.item] : characters[indexPath.item]
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: characterCell.reusableIdentifier, for: indexPath) as! characterCell
        cell.set(item: character)
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }

}
//MARK: - UICollectionView DataSource
extension CharacterVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let character:RMCharacterElement = isSearching ? filteredCharacters[indexPath.item] : characters[indexPath.item]
        self.pushDetailVC(characterInfo: character)
       
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        if offsetY > contentHeight - height {
            if !isSearching {
                if hasMoreCharacter {
                    characterIdFirst += 30
                    getCharactersInfo(id: characterIdFirst)
                }
            }
        }
    }
}


//MARK: - UISearchResults Updating
extension CharacterVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {return}
        isSearching = true
        filteredCharacters = characters.filter{ chrctr in
            if let name = chrctr.name{
                if name.lowercased().contains(filter.lowercased()){
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        
        DispatchQueue.main.async {self.collectionView.reloadData()}
    }
    
}
//MARK: - UISearchBar Delegate
extension CharacterVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        DispatchQueue.main.async {self.collectionView.reloadData()}
    }
}
