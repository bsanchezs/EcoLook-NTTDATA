//
//  VIPERProtocols.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 12/07/22.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    
    func showSuccessImageDetailPostByUrl(dataImage: Data)
    
}

protocol DetailPresenterProtocol: AnyObject {
    
    func fetchImageDetailPostByUrl(url: String)
    func loadSuccessImageDetailPostByUrl(dataImage: Data)
    
    func fetch
    
}

protocol DetailRouterProtocol {
    
}

protocol DetailInteractorProtocol{
    
    func getImagePostDetailByUrl(url: String)
    
}
