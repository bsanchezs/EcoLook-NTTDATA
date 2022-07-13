//
//  VIPERProtocols.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 12/07/22.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    
    func showSuccessImageDetailPostByUrl(dataImage: Data)
    
    func changeImageButtonByResponse(response: Int)
    
}

protocol DetailPresenterProtocol: AnyObject {
    
    func fetchImageDetailPostByUrl(url: String)
    func loadSuccessImageDetailPostByUrl(dataImage: Data)
    
    func fetchInsertFavoritePostByIdUserAndIdPost(idUser: Int, idPost: Int)
    func loadSuccessResponseInsertFavoritePostByIdUserAndIdPost(response: Int)
    
    func fetchDeleteFavoritePostByIdUserAndIdPost(idUser: Int, idPost: Int)
    func loadSuccessResponseDeleteFavoritePostByIdUserAndIdPost(response: Int)
    
    
}

protocol DetailRouterProtocol {
    
}

protocol DetailInteractorProtocol{
    
    func getImagePostDetailByUrl(url: String)
    
    func insertFavoritePostByIdUserAndIdPost(idUser: Int, idPost: Int)
    func deleteFavoritePostByIdUserAndIdPost(idUser: Int, idPost: Int)
    
}
