//
//  NewPostInteractor.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 13/07/22.
//

import Foundation

class NewPostInteractor {
    
    weak var presenter: NewPostPresenterProtocol?
    
}

extension NewPostInteractor: NewPostInteractorProtocol {
    
    func insertNewpostByUser(idUser: Int, newPost: Post) {
        
        print("TODO: Armar el repository")
        
    }
    
}
