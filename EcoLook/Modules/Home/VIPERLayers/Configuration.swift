//
//  Configuration.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import UIKit


class HomeConfiguration {
    
    class func setHomeVIPER() -> UIViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            fatalError("no se encontró viewcontroller")
        }
        
        let homePresenter = HomePresenter()
        let homeRouter = HomeRouter(currentViewController: viewController)
        let homeInteractor = HomeInteractor()
        
        
        viewController.presenter = homePresenter
        
        homePresenter.view = viewController
        homePresenter.interactor = homeInteractor
        homePresenter.router = homeRouter
        
        homeInteractor.presenter = homePresenter
        
        homeRouter.presenter = homePresenter
        
        return viewController


    }
    
}
