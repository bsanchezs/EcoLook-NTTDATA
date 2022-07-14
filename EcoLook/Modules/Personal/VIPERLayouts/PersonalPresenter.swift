//
//  PersonalPresenter.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

class PersonalPresenter {
    
    weak var view: PersonalViewProtocol?
    var router: PersonalRouterProtocol?
    var interactor: PersonalInteractorProtocol?
    
}

extension PersonalPresenter: PersonalPresenterProtocol {
    
    func fetchPersonalPostsByUser(idUser: Int) {
        
        interactor?.getPersonalPostsByUser(idUser: idUser)
        
    }
    
    func loadSuccessPersonalPostsByUser(personalPosts: [Post]?) {
        
        if let personalPosts = personalPosts {
            
            view?.showSuccessPersonalPostsByUser(personalPosts: personalPosts)
            
        }else{
            
            view?.showSuccessPersonalPostsByUser(personalPosts: [])
            
        }
        
    }
    
    func fetchImagePersonalPostByUrl(url: String, cell: PostsTableViewCell?) {
        
        interactor?.getImagePersonalPostByUrl(url: url, cell: cell)
        
    }
    
    func loadSuccessImagePersonalPostByUrl(dataImage: Data, cell: PostsTableViewCell?) {
        
        view?.showSuccessImagePersonalPostByUrl(dataImage: dataImage, cell: cell)
        
    }
    
    func requestSendToDetail(idPost: Int) {
        
        router?.sendToDetail(idPost: idPost)
        
    }
    
    func requestSendToNewPost() {
        
        router?.sendToNewPost()
        
    }
    
    
    
}
