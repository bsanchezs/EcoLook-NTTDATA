//
//  Configuration.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 12/07/22.
//

import UIKit

class DetailConfiguration {
    
    class func setDetailVIPER() -> UIViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? DetailViewController else {
            fatalError("no se encontró viewcontroller")
        }
        
//        let homePresenter = HomePresenter()
//        let homeRouter = HomeRouter(currentViewController: viewController)
//        let homeInteractor = HomeInteractor()
//
//
//        viewController.presenter = homePresenter
//
//        homePresenter.view = viewController
//        homePresenter.interactor = homeInteractor
//        homePresenter.router = homeRouter
//
//        homeInteractor.presenter = homePresenter
//
//        homeRouter.presenter = homePresenter
        
        return viewController


    }
    
}
