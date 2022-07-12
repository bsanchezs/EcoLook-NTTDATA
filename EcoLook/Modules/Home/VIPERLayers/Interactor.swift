//
//  Interactor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import Foundation

class HomeInteractor {
    
    let postRepository: PostsRepository? = PostsRemoteRepository()
    
    weak var presenter: HomePresenterProtocol?
    
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func getAllPostsByUser(idUser: Int) {
        
//        print("Dato del interactor: \(idUser)")
        
        postRepository?.getAllPostsByUser(idUser: idUser, success: { allPosts in
            
            self.presenter?.loadSuccessAllPostsByUser(allPosts: allPosts)
            
            
        }, failure: { _ in })
        
    }
    
    func getImagePostByUrl(url: String, cell: PostsTableViewCell?) {
        
        
        
//        if let url = URL(string: url) {
//
//            let task = URLSession.shared.dataTask(with: url) { data, response, error in guard let data = data, error == nil else { return }
//
//                DispatchQueue.main.async {
//
//
//                }
//            }
//
//            task.resume()
//        }
        
    }
    
}
