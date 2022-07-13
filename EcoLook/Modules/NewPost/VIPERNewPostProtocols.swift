//
//  VIPERNewPostProtocols.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 13/07/22.
//

import Foundation

protocol NewPostViewProtocol: AnyObject {
    
}

protocol NewPostPresenterProtocol: AnyObject {
    
    func fetchInsertNewPostByUser(idUser: Int, newPost: Post)
    
}

protocol NewPostRouterProtocol {
    
}

protocol NewPostInteractorProtocol{
    
    func insertNewpostByUser(idUser: Int, newPost: Post)
    
}
