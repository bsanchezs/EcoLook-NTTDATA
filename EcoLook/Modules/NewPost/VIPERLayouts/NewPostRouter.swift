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
        
        savingAlert = UIAlertController(title: "Guardando publicacion...", message: "Espere un momento, por favor.", preferredStyle: .alert)
        
        currentViewController?.present(savingAlert!, animated: true)
        
    }
    
    func showSuccessAlert() {
        
        savingAlert?.dismiss(animated: true, completion: nil)
        
        let alert = UIAlertController(title: "Guardado exitoso", message: "Se ha guardado exitosamente su publicacion", preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "Ok", style: .default) { _ in
            
            self.currentViewController?.navigationController?.popViewController(animated: true)
            
        }
        
        alert.addAction(okay)
        
        currentViewController?.present(alert, animated: true)
        
    }
    
    func goBackToHome() {
        
        currentViewController?.navigationController?.popViewController(animated: true)
        
    }
    
    func showErrorFormAlert(message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let okay = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okay)
        
        currentViewController?.present(alert, animated: true)
        
    }
}
