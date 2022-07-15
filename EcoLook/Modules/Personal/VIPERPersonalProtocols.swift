//
//  VIPERPersonalProtocols.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

protocol PersonalViewProtocol: AnyObject {
    
    func showSuccessPersonalPostsByUser(personalPosts: [Post])
    func showSuccessImagePersonalPostByUrl(image: UIImage, cell: PostsTableViewCell?)
    
}

protocol PersonalPresenterProtocol: AnyObject{
    
    func fetchPersonalPostsByUser(idUser: Int)
    func loadSuccessPersonalPostsByUser(personalPosts: [Post]?)
    
    func fetchImagePersonalPostByUrl(url: String, cell: PostsTableViewCell?)
    func loadSuccessImagePersonalPostByUrl(image: UIImage, cell: PostsTableViewCell?)
    
    func requestSendToDetail(idPost: Int)
    
    func requestSendToNewPost()
    
}

protocol PersonalRouterProtocol{
    
    func sendToDetail(idPost: Int)
    
    func sendToNewPost()
    
}

protocol PersonalInteractorProtocol{
    
    func getPersonalPostsByUser(idUser: Int)
    func getImagePersonalPostByUrl(url: String, cell: PostsTableViewCell?)
    
}
