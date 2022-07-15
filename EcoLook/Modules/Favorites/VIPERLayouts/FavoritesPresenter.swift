//
//  Favorites.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

class FavoritesPresenter {
    
    weak var view: FavoritesViewProtocol?
    var router: FavoritesRouterProtocol?
    var interactor: FavoritesInteractorProtocol?
    
}

extension FavoritesPresenter: FavoritesPresenterProtocol {
    
    func fetchFavoritesPostsByUser(idUser: Int) {
        
        interactor?.getFavoritesPostsByUser(idUser: idUser)
        
    }
    
    func loadSuccessFavoritesPostsByUser(favoritesPosts: [Post]?) {
        
        if let favoritesPosts = favoritesPosts {
            
            view?.showSuccessFavoritesPostsByUser(favoritesPosts: favoritesPosts)
            
        }else{
            
            view?.showSuccessFavoritesPostsByUser(favoritesPosts: [])
            
        }
        
        
        
    }
    
    func fetchImageFavoritePostByUrl(url: String, cell: PostsTableViewCell?) {
        
        interactor?.getImageFavoritePostByUrl(url: url, cell: cell)
        
    }
    
    func loadSuccessImageFavoritePostByUrl(image: UIImage, cell: PostsTableViewCell?) {
        
        view?.showSuccessImageFavoritePostByUrl(image: image, cell: cell)
        
    }
    
    func requestSendToDetail(idPost: Int) {
        
        router?.sendToDetail(idPost: idPost)
        
    }
    
    func requestSendToNewPost() {
        
        router?.sendToNewPost()
        
    }
    
    
    
    
}
