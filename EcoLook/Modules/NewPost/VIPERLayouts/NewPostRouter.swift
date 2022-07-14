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
    var savingAlert: UIAlertController?
    
    init(currentViewController: UIViewController) {
        self.currentViewController = currentViewController
    }
    
}

extension NewPostRouter: NewPostRouterProtocol {
    
    func showSavingAlert() {
        
        savingAlert = UIAlertController(title: "Guardando publicacion", message: "Espere un momento, por favor.", preferredStyle: .alert)
        
        currentViewController?.present(savingAlert!, animated: true)
        
    }
    
}
