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
    
    
    
}
