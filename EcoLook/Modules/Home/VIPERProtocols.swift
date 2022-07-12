//
//  VIPERProtocols.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    
    func showSuccessAllPostsByUser(allPosts: [Post])
}

protocol HomePresenterProtocol: AnyObject{
    
    func fetchAllPostsByUser(idUser: Int)
    func loadSuccessAllPostsByUser(allPosts: [Post]?)
    func fetchImagePostByUrl(url: String, cell: PostsTableViewCell?)
    
}

protocol HomeRouterProtocol{
    
}

protocol HomeInteractorProtocol{
    
    func getAllPostsByUser(idUser: Int)
    func getImagePostByUrl(url: String, cell: PostsTableViewCell?)
}



