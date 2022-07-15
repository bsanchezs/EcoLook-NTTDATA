//
//  Presenter.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 12/07/22.
//

import UIKit

class DetailPresenter {
    
    weak var view: DetailViewProtocol?
    var router: DetailRouterProtocol?
    var interactor: DetailInteractorProtocol?

}

extension DetailPresenter: DetailPresenterProtocol {
    
    func fetchImageDetailPostByUrl(url: String) {
        
        interactor?.getImagePostDetailByUrl(url: url)
        
    }
    
    func loadSuccessImageDetailPostByUrl(image: UIImage) {
        
        view?.showSuccessImageDetailPostByUrl(image: image)
        
    }
    
    func fetchInsertFavoritePostByIdUserAndIdPost(idUser: Int, idPost: Int) {
        
        interactor?.insertFavoritePostByIdUserAndIdPost(idUser: idUser, idPost: idPost)
        
    }
    
    func loadSuccessResponseInsertFavoritePostByIdUserAndIdPost(response: Int) {
        
        view?.changeImageButtonByResponse(response: response)
        
    }
    
    func fetchDeleteFavoritePostByIdUserAndIdPost(idUser: Int, idPost: Int) {
        
        interactor?.deleteFavoritePostByIdUserAndIdPost(idUser: idUser, idPost: idPost)
        
    }
    
    func loadSuccessResponseDeleteFavoritePostByIdUserAndIdPost(response: Int) {
        
        view?.changeImageButtonByResponse(response: response)
        
    }
    
}
