//
//  NewPostConfiguration.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 13/07/22.
//

import UIKit

class NewPostConfiguration {
    
    class func setNewPostVIPER() -> UIViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "NewPostViewController") as? NewPostViewController else {
            fatalError("no se encontró viewcontroller")
        }
        
        let newPostPresenter = NewPostPresenter()
        let newPostRouter = NewPostRouter(currentViewController: viewController)
        let newPostInteractor = NewPostInteractor()

        viewController.presenter = newPostPresenter

        newPostPresenter.view = viewController
        newPostPresenter.interactor = newPostInteractor
        newPostPresenter.router = newPostRouter

        newPostInteractor.presenter = newPostPresenter

        newPostRouter.presenter = newPostPresenter
        
        return viewController


    }
    
}


