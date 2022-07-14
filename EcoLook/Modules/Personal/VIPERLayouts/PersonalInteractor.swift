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
        
        print("asd")
        
    }
    
    func getImagePersonalPostByUrl(url: String, cell: PostsTableViewCell?) {
        
        networkImages?.getImageByUrl(url: url, success: { dataImage in
            
            self.presenter?.loadSuccessImagePersonalPostByUrl(dataImage: dataImage, cell: cell)
            
        }, failure: { _ in })
        
    }
    
    
    
    
}
