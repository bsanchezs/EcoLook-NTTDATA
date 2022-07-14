//
//  Presenter.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import UIKit

class HomePresenter {
    
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func fetchAllPostsByUser(idUser: Int) {
        
//        print("El dato que llego es: \(idUser)")
        interactor?.getAllPostsByUser(idUser: idUser)
        
    }
    
    func loadSuccessAllPostsByUser(allPosts: [Post]?) {
        
        if let allPosts = allPosts {
            
            view?.showSuccessAllPostsByUser(allPosts: allPosts)
            
        }else {
            
            view?.showSuccessAllPostsByUser(allPosts: [])
            
        }
        
    }
    
    func fetchImagePostByUrl(url: String, cell: PostsTableViewCell?) {
        
        interactor?.getImagePostByUrl(url: url, cell: cell)
        
    }
    
    func loadSuccessImagePostByUrl(dataImage: Data, cell: PostsTableViewCell?) {
        
        view?.showSuccessImagePostByUrl(dataImage: dataImage, cell: cell)
        
    }
    
    func requestSendToDetail(idPost: Int) {
        
        router?.sendToDetail(idPost: idPost)
        
    }
    
    func requestSendToNewPost() {
        
        router?.sendToNewPost()
        
    }
    
}
