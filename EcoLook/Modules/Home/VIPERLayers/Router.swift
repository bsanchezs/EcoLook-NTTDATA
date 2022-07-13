//
//  Router.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

//import Foundation
import UIKit

class HomeRouter {
    
    weak var presenter: HomePresenter?
    var currentViewController: UIViewController?
    
    init( currentViewController: UIViewController ){
        self.currentViewController = currentViewController
    }
}

extension HomeRouter: HomeRouterProtocol {
    
    
    func sendToDetail(idPost: Int) {
        
//        currentViewController!.performSegue(withIdentifier: "homeToDetailSegue", sender: idPost)
        let detailViewController = DetailConfiguration.setDetailVIPER()
        currentViewController!.present(detailViewController, animated: true, completion: nil)
        
    }
    
    
    
}
