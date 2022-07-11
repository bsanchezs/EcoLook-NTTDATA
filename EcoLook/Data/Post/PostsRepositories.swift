//
//  Repositories.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 10/07/22.
//

import Foundation

protocol PostsRepository {
    
    func getAllPostsByUser(idUser: Int, success: @escaping ([Post]?) -> Void, failure: @escaping (Error?) -> Void)
    
}
