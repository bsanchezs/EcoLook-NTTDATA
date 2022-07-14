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
            case .success(let allPosts):

                success(allPosts)

            case .failure(let error):
                
                failure(error)
                
            }

        }
        
    }
    
    func insertFavoritePostByUserAndPost(idUser: Int, idPost: Int, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void) {
        
        let idUserString = String(idUser)
        let idPostString = String(idPost)
        let url = "https://apiecolook.improntux.online/public/api/insertarFavoritoPorUsuarioPublicacion/" + idUserString + "/" + idPostString
        
        AF.request(url,
                   method: .post,
                   parameters: 1,
                   encoder: JSONParameterEncoder.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil
                  ).responseDecodable(of: Int.self) { response in
                        
                        switch response.result {
                            
                            case .success(let respuesta):
                                
                                success(respuesta)
                                
                            case .failure(let error):
                                
                                failure(error)
                            
                        }
            
                    }
        
    }
    
    func deleteFavoritePostByUserAndPost(idUser: Int, idPost: Int, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void) {
        
        let idUserString = String(idUser)
        let idPostString = String(idPost)
        let url = "https://apiecolook.improntux.online/public/api/borrarFavoritoPorUsuarioPublicacion/" + idUserString + "/" + idPostString
        
        AF.request(url,
                   method: .post,
                   parameters: 1,
                   encoder: JSONParameterEncoder.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil
                  ).responseDecodable(of: Int.self) { response in
                        
                        switch response.result {
                            
                            case .success(let respuesta):
                                
                                success(respuesta)
                                
                            case .failure(let error):
                                
                                failure(error)
                            
                        }
            
                    }
        
        
    }
    
    func insertNewPost(newPost: Post, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void) {
        
        let url = "https://apiecolook.improntux.online/public/api/insertarPublicacionPorUsuario"
        
        AF.request(url,
                   method: .post,
                   parameters: newPost,
                   encoder: JSONParameterEncoder.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil
                  ).responseDecodable(of: Int.self) { response in
            
            switch response.result {
                
                case .success(let respuesta):
                    
                    success(respuesta)
                    
                case .failure(let error):
                    
                    failure(error)
                
            }

        }
        
    }
    
    func getFavoritesPostsByUser(idUser: Int, success: @escaping ([Post]?) -> Void, failure: @escaping (Error?) -> Void) {
        
        let idUserString = String(idUser)
        let url = "https://apiecolook.improntux.online/public/api/obtenerPublicacionesFavoritasPorUsuario/" + idUserString
        
        AF.request(url).responseDecodable(of: [Post].self){
            response in
            
            switch response.result {
            case .success(let favoritesPosts):

                success(favoritesPosts)

            case .failure(let error):
                
                failure(error)
                
            }

        }
        
    }
    
    func getPersonalPostsByUser(idUser: Int, success: @escaping ([Post]?) -> Void, failure: @escaping (Error?) -> Void) {
        
        let idUserString = String(idUser)
        let url = "https://apiecolook.improntux.online/public/api/obtenerPublicacionesPropiasPorUsuario/" + idUserString
        
        AF.request(url).responseDecodable(of: [Post].self){
            response in
            
            switch response.result {
            case .success(let personalPosts):

                success(personalPosts)

            case .failure(let error):
                
                failure(error)
                
            }

        }
        
    }
    
    
}
