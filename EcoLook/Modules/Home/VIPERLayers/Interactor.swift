//
//  Interactor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import Foundation

class HomeInteractor {
    
    let postRepository: PostsRepository? = PostsRemoteRepository()
    
    weak var presenter: HomePresenterProtocol?
    
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func getAllPostsByUser(idUser: Int) {
        
        print("Dato del interactor: \(idUser)")
        
        postRepository?.getAllPostsByUser(idUser: idUser, success: { posts in
            
            print("Saludos desde el interactor: \(posts)")
            
        }, failure: { _ in })
        
    }
    
}
