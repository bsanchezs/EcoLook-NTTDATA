//
//  Interactor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import Foundation

class HomeInteractor {
    
    let tagsRepository: TagsRepository? = TagsLocalRepository()
    let postRepository: PostsRepository? = PostsRemoteRepository()
    let networkingImages: NetworkingImages? = NetworkingImagesByUrl()
    
    weak var presenter: HomePresenterProtocol?
    
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func getAllTags() {
        
        tagsRepository?.getAllTags(success: { tags in
            
            self.presenter?.loadSuccessAllTags(tags: tags)
            
        }, failure: { _ in })
        
    }
    
    func getAllPostsByUser(idUser: Int) {
        
//        print("Dato del interactor: \(idUser)")
        
        postRepository?.getAllPostsByUser(idUser: idUser, success: { allPosts in
            
            self.presenter?.loadSuccessAllPostsByUser(allPosts: allPosts)
            
            
        }, failure: { _ in })
        
    }
    
    func getImagePostByUrl(url: String, cell: PostsTableViewCell?) {
        
        networkingImages?.getImageByUrl(url: url, success: { dataImage in
            
//            print("Hay data? : \(dataImage)")
            
            self.presenter?.loadSuccessImagePostByUrl(image: dataImage, cell: cell)
            
        }, failure: { _ in })
        
        
        
    }
    
}
