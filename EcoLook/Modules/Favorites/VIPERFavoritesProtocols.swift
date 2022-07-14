//
//  VIPERFavoritesProtocols.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

protocol FavoritesViewProtocol: AnyObject {
    
    func showSuccessFavoritesPostsByUser(favoritesPosts: [Post])
    func showSuccessImageFavoritePostByUrl(dataImage: Data, cell: PostsTableViewCell?)
    
}

protocol FavoritesPresenterProtocol: AnyObject{
    
    func fetchFavoritesPostsByUser(idUser: Int)
    func loadSuccessFavoritesPostsByUser(favoritesPosts: [Post]?)
    
    func fetchImageFavoritePostByUrl(url: String, cell: PostsTableViewCell?)
    func loadSuccessImageFavoritePostByUrl(dataImage: Data, cell: PostsTableViewCell?)
    
    func requestSendToDetail(idPost: Int)
    
    func requestSendToNewPost()

    
}

protocol FavoritesRouterProtocol{
    
    func sendToDetail(idPost: Int)
    
    func sendToNewPost()
    
}

protocol FavoritesInteractorProtocol{
    
    func getFavoritesPostsByUser(idUser: Int)
    func getImageFavoritePostByUrl(url: String, cell: PostsTableViewCell?)
    
}
