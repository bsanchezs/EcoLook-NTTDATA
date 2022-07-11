//
//  Interactor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import Foundation

class HomeInteractor {
    
    
    weak var presenter: HomePresenterProtocol?
    
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func getAllPostsByUser(idUser: Int) {
        
        print("Dato del interactor: \(idUser)")
        
    }
    
}
