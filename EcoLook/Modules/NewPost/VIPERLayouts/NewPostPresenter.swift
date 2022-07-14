//
//  NewPostPresenter.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 13/07/22.
//

import Foundation

class NewPostPresenter {
    
    weak var view: NewPostViewProtocol?
    var router: NewPostRouterProtocol?
    var interactor: NewPostInteractorProtocol?
    
}

extension NewPostPresenter: NewPostPresenterProtocol {
    
    func fetchInsertNewPostByUser(newPost: Post) {
        
        interactor?.insertNewPostByUser(newPost: newPost)
        
    }
    
}
