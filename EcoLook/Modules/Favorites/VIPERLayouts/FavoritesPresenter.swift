//
//  Favorites.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import Foundation

class FavoritesPresenter {
    
    weak var view: FavoritesViewProtocol?
    var router: FavoritesRouterProtocol?
    var interactor: FavoritesInteractorProtocol?
    
}

extension FavoritesPresenter: FavoritesPresenterProtocol {
    
    
    
}
