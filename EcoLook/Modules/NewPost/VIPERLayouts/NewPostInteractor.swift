//
//  NewPostInteractor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 13/07/22.
//

import Foundation

class NewPostInteractor {
    
    weak var presenter: NewPostPresenterProtocol?
    var postsRepository: PostsRepository? = PostsRemoteRepository()
    
}

extension NewPostInteractor: NewPostInteractorProtocol {
    
    func insertNewPostByUser(newPost: Post) {
        
        postsRepository?.insertNewPost(newPost: newPost, success: { _ in
            
        }, failure: { _ in })
        
    }
    
}
