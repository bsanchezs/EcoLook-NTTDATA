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
    
    func fetchInsertNewPostByUser(newPost: Post)
    func loadSuccessInsertNewPostByUser(response: Int)
    
}

protocol NewPostRouterProtocol {
    
    func showSavingAlert()
    func showSuccessAlert()
    
}

protocol NewPostInteractorProtocol{
    
    func insertNewPostByUser(newPost: Post)
    
}
