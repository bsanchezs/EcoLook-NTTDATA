//
//  PostsRemoteRepository.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 10/07/22.
//

import Foundation
import Alamofire

class PostsRemoteRepository: PostsRepository {
    
    
    func getAllPostsByUser(idUser: Int, success: @escaping ([Post]?) -> Void, failure: @escaping (Error?) -> Void) {
        
        let idUserString = String(idUser)
        let url = "https://apiecolook.improntux.online/public/api/obtenerTodasPublicacionesPorUsuario/" + idUserString
        
        AF.request(url).responseDecodable(of: [Post].self){
            response in
            
            print("Respuestaaaa: \(response.result)")
            
            switch response.result {
            case .success(let postsGet):

                success(postsGet)

            case .failure(let error):
                
                failure(error)
                
            }

        }
        
    }
    
}
