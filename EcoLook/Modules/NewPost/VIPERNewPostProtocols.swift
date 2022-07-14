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
    
    func requestGoBackToHome()
    
}

protocol NewPostRouterProtocol {
    
    func showSavingAlert()
    func showSuccessAlert()
    
    func goBackToHome()
    
}

protocol NewPostInteractorProtocol{
    
    func insertNewPostByUser(newPost: Post)
    
}
