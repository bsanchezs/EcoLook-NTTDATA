//
//  PostsRemoteRepository.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 10/07/22.
//

import Foundation
import Alamofire

class PostsRemoteRepository: PostsRepository {
    
    
    func getAllPostsByUser(idUser: Int) {
        
        let idUserString = String(idUser)
        let url = "https://apiecolook.improntux.online/public/api/obtenerTodasPublicacionesPorUsuario/" + idUserString
        
        AF.request(url).response { response in
            debugPrint(response)
        }
        
    }
    
}
