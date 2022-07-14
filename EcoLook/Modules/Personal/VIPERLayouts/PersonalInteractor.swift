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
    
    
    
}
