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
        
//        AF.request(url).responseDecodable(of: [Post].self){
//            response in
//
//            switch response.result {
//            case .success(let beers):
//
//                self.beerList = beers
//                self.tableView.reloadData()
//
////                debugPrint(beers)
//            case .failure(let error):
//                print(error)
//            }
//
//        }
        
    }
    
}
