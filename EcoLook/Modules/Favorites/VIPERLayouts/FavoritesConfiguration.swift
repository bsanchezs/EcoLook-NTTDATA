//
//  FavoritesConfiguration.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit


class FavoritesConfiguration {
    
    class func setFavoritesVIPER() -> UIViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as? FavoritesViewController else {
            fatalError("no se encontró viewcontroller")
        }
        
        let favoritesPresenter = FavoritesPresenter()
        let favoritesRouter = FavoritesRouter(currentViewController: viewController)
        let favoritesInteractor = FavoritesInteractor()
        
        
        viewController.presenter = favoritesPresenter
        
        favoritesPresenter.view = viewController
        favoritesPresenter.interactor = favoritesInteractor
        favoritesPresenter.router = favoritesRouter
        
        favoritesInteractor.presenter = favoritesPresenter
        
        favoritesRouter.presenter = favoritesPresenter
        
        return viewController


    }
    
}
