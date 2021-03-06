//
//  Interactor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 12/07/22.
//

import Foundation

class DetailInteractor {
    
    let networkingImages: NetworkingImages? = NetworkingImagesByUrl()
    let postsRepository: PostsRepository? = PostsRemoteRepository()
    
    weak var presenter: DetailPresenterProtocol?
    
}

extension DetailInteractor: DetailInteractorProtocol {
    
    func getImagePostDetailByUrl(url: String) {
        
        networkingImages?.getImageByUrl(url: url, success: { dataImage in
            
            self.presenter?.loadSuccessImageDetailPostByUrl(image: dataImage)
            
        }, failure: { _ in })
        
    }
    
    func insertFavoritePostByIdUserAndIdPost(idUser: Int, idPost: Int) {
        
        postsRepository?.insertFavoritePostByUserAndPost(idUser: idUser, idPost: idPost, success: { respuesta in
            
            self.presenter?.loadSuccessResponseInsertFavoritePostByIdUserAndIdPost(response: respuesta)
            
//            print("mandalo de regreso \(respuesta)")
            
        }, failure: { _ in })
        
    }
    
    func deleteFavoritePostByIdUserAndIdPost(idUser: Int, idPost: Int) {
        
        postsRepository?.deleteFavoritePostByUserAndPost(idUser: idUser, idPost: idPost, success: { respuesta in
            
            self.presenter?.loadSuccessResponseDeleteFavoritePostByIdUserAndIdPost(response: respuesta)
            
//            print("mandalo de regreso \(respuesta)")
            
        }, failure: { _ in })
        
    }
}
