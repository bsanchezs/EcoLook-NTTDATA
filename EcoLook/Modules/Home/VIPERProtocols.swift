//
//  VIPERProtocols.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    
    func showSuccessAllPostsByUser(allPosts: [Post])
    func showSuccessImagePostByUrl(dataImage: Data, cell: PostsTableViewCell?)
}

protocol HomePresenterProtocol: AnyObject{
    
    func fetchAllPostsByUser(idUser: Int)
    func loadSuccessAllPostsByUser(allPosts: [Post]?)
    
    func fetchImagePostByUrl(url: String, cell: PostsTableViewCell?)
    func loadSuccessImagePostByUrl(dataImage: Data, cell: PostsTableViewCell?)
    
    func requestSendToDetail(idPost: Int)
    
    func requestSendToNewPost()
    
}

protocol HomeRouterProtocol{
    
    func sendToDetail(idPost: Int)
    
    func sendToNewPost()
    
}

protocol HomeInteractorProtocol{
    
    func getAllPostsByUser(idUser: Int)
    func getImagePostByUrl(url: String, cell: PostsTableViewCell?)
}



