//
//  PersonalInteractor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

class PersonalInteractor {
    
    weak var presenter: PersonalPresenterProtocol?
    var postsRepository: PostsRepository? = PostsRemoteRepository()
    var networkImages: NetworkingImages? = NetworkingImagesByUrl()
    
}

extension PersonalInteractor: PersonalInteractorProtocol {
    
    func getPersonalPostsByUser(idUser: Int) {
        
        postsRepository?.getPersonalPostsByUser(idUser: idUser, success: { personalPost in
            
            self.presenter?.loadSuccessPersonalPostsByUser(personalPosts: personalPost)
            
        }, failure: { _ in  })
        
    }
    
    func getImagePersonalPostByUrl(url: String, cell: PostsTableViewCell?) {
        
        networkImages?.getImageByUrl(url: url, success: { dataImage in
            
            self.presenter?.loadSuccessImagePersonalPostByUrl(image: dataImage, cell: cell)
            
        }, failure: { _ in })
        
    }
    
    
    
    
}
