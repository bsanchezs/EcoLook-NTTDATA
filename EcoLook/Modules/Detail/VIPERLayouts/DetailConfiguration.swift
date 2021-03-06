//
//  Configuration.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 12/07/22.
//

import UIKit

class DetailConfiguration {
    
    class func setDetailVIPER(idPost: Int) -> UIViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("no se encontrĂ³ viewcontroller")
        }
        
        let detailPresenter = DetailPresenter()
        let detailRouter = DetailRouter()
        let detailInteractor = DetailInteractor()

        viewController.presenter = detailPresenter

        detailPresenter.view = viewController
        detailPresenter.interactor = detailInteractor
        detailPresenter.router = detailRouter

        detailInteractor.presenter = detailPresenter

        detailRouter.presenter = detailPresenter
        
        viewController.idSelectedPost = idPost
        
        return viewController


    }
    
}
