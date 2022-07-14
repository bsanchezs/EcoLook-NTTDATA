//
//  FavoritesRouter.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

class FavoritesRouter {
    
    weak var presenter: FavoritesPresenterProtocol?
    var currentViewController: UIViewController?
    
    init(currentViewController: UIViewController){
        
        self.currentViewController = currentViewController
        
    }
    
}

extension FavoritesRouter: FavoritesRouterProtocol {
    
    
    
}
