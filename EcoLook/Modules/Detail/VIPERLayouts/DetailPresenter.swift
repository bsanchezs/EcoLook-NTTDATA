//
//  Presenter.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 12/07/22.
//

import Foundation

class DetailPresenter {
    
    weak var view: DetailViewProtocol?
    var router: DetailRouterProtocol?
    var interactor: DetailInteractorProtocol?

}

extension DetailPresenter: DetailPresenterProtocol {
    
    func fetchImageDetailPostByUrl(url: String) {
        
        interactor?.getImagePostDetailByUrl(url: url)
        
    }
    
    func loadSuccessImageDetailPostByUrl(dataImage: Data) {
        
        view?.showSuccessImageDetailPostByUrl(dataImage: dataImage)
        
    }
    
    
    
}
