//
//  VIPERProtocols.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    
    func showSuccessAllTags(tags: [Tag]?)
    
    func showSuccessAllPostsByUser(allPosts: [Post])
    func showSuccessImagePostByUrl(image: UIImage, cell: PostsTableViewCell?)
    
}

protocol HomePresenterProtocol: AnyObject{
    
    func fetchAllTags()
    func loadSuccessAllTags(tags: [Tag]?)
    
    func fetchAllPostsByUser(idUser: Int)
    func loadSuccessAllPostsByUser(allPosts: [Post]?)
    
    func fetchImagePostByUrl(url: String, cell: PostsTableViewCell?)
    func loadSuccessImagePostByUrl(image: UIImage, cell: PostsTableViewCell?)
    
    func requestSendToDetail(idPost: Int)
    
    func requestSendToNewPost()
    
}

protocol HomeRouterProtocol{
    
    func sendToDetail(idPost: Int)
    
    func sendToNewPost()
    
}

protocol HomeInteractorProtocol{
    
    func getAllTags()
    
    func getAllPostsByUser(idUser: Int)
    func getImagePostByUrl(url: String, cell: PostsTableViewCell?)
}



