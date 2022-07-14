//
//  NewPostRouter.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 13/07/22.
//

import UIKit

class NewPostRouter {
    
    weak var presenter: NewPostPresenterProtocol?
    var currentViewController: UIViewController?
    
    init(currentViewController: UIViewController) {
        self.currentViewController = currentViewController
    }
    
}

extension NewPostRouter: NewPostRouterProtocol {
    
    
}
