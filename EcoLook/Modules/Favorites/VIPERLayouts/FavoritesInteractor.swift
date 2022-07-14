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
    
}

extension FavoritesInteractor: FavoritesInteractorProtocol {
    
    
    func getFavoritesPostsByUser(idUser: Int) {
        print("Llega hasta aca: \(idUser)")
    }
    
    func getImageFavoritePostByUrl(url: String, cell: PostsTableViewCell?) {
        print("Para la imagen llega hasta aca: \(url)")
    }
    
    
    
    
}
