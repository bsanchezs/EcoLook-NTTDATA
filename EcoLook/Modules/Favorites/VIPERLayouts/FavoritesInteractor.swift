//
//  FavoritesInteractor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import Foundation

class FavoritesInteractor {
    
    weak var presenter: FavoritesPresenterProtocol?
    var postsRepository: PostsRepository? = PostsRemoteRepository()
    var networkImages: NetworkingImages? = NetworkingImagesByUrl()
    
}

extension FavoritesInteractor: FavoritesInteractorProtocol {
    
    
    func getFavoritesPostsByUser(idUser: Int) {
        
        postsRepository?.getFavoritesPostsByUser(idUser: idUser, success: { favoritesPosts in
            
            self.presenter?.loadSuccessFavoritesPostsByUser(favoritesPosts: favoritesPosts)
            
        }, failure: { _ in })
        
    }
    
    func getImageFavoritePostByUrl(url: String, cell: PostsTableViewCell?) {
        
        networkImages?.getImageByUrl(url: url, success: { dataImage in
            
            self.presenter?.loadSuccessImageFavoritePostByUrl(dataImage: dataImage, cell: cell)
            
        }, failure: { _ in })
        
    }
    
    
    
    
}
