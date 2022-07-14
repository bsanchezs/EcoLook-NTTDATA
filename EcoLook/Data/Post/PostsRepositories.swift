//
//  Repositories.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 10/07/22.
//

import Foundation

protocol PostsRepository {
    
    func getAllPostsByUser(idUser: Int, success: @escaping ([Post]?) -> Void, failure: @escaping (Error?) -> Void)
    
    func insertFavoritePostByUserAndPost(idUser: Int, idPost: Int, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void)
    
    func deleteFavoritePostByUserAndPost(idUser: Int, idPost: Int, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void)
    
    func insertNewPost(newPost: Post, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void)
    
    func getFavoritesPostsByUser(idUser: Int, success: @escaping ([Post]?) -> Void, failure: @escaping (Error?) -> Void)
    
    func getPersonalPostsByUser(idUser: Int, success: @escaping ([Post]?) -> Void, failure: @escaping (Error?) -> Void)
}
