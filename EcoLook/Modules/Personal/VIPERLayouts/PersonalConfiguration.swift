//
//  PersonalConfiguration.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit


class PersonalConfiguration {
    
    class func setPersonalVIPER() -> UIViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "PersonalViewController") as? PersonalViewController else {
            fatalError("no se encontró viewcontroller")
        }
        
        let personalPresenter = PersonalPresenter()
        let personalRouter = PersonalRouter(currentViewController: viewController)
        let personalInteractor = PersonalInteractor()
        
        
        viewController.presenter = personalPresenter
        
        personalPresenter.view = viewController
        personalPresenter.interactor = personalInteractor
        personalPresenter.router = personalRouter
        
        personalInteractor.presenter = personalPresenter
        
        personalRouter.presenter = personalPresenter
        
        return viewController


    }
    
}
