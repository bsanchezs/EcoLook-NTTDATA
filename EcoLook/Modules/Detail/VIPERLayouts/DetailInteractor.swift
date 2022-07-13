//
//  Interactor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 12/07/22.
//

import Foundation

class DetailInteractor {
    
    let networkingImages: NetworkingImages? = NetworkingImagesByUrl()
    
    weak var presenter: DetailPresenterProtocol?
    
}

extension DetailInteractor: DetailInteractorProtocol {
    
    func getImagePostDetailByUrl(url: String) {
        
        networkingImages?.getImageByUrl(url: url, success: { dataImage in
            
            self.presenter?.loadSuccessImageDetailPostByUrl(dataImage: dataImage)
            
        }, failure: { _ in })
        
    }
    
}
