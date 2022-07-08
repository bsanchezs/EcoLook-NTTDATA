//
//  Configuration.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import UIKit


class HomeConfiguration {
    
    class func setHomeVIPER() {

        let homePresenter = HomePresenter()
        let homeRouter = HomeRouter()
        let homeInteractor = HomeInteractor()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            fatalError("aaaaaaaaaaaaa")
        }
        
        viewController.homePresenter = homePresenter
        
        homePresenter.view = viewController
        homePresenter.interactor = homeInteractor
        homePresenter.router = homeRouter
        
        homeRouter.presenter = homePresenter
        


    }
    
}
