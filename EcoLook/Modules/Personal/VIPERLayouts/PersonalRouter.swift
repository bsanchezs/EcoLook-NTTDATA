//
//  PersonalRouter.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

class PersonalRouter {
    
    weak var presenter: PersonalPresenterProtocol?
    var currentViewController: UIViewController?
    
    init(currentViewController: UIViewController){
        
        self.currentViewController = currentViewController
        
    }
    
}

extension PersonalRouter: PersonalRouterProtocol {
    
    
    
}
