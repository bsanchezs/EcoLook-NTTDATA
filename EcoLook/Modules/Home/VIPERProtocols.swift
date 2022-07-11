//
//  VIPERProtocols.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 7/07/22.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    
    func setConfigurationHomeViewController()
}

protocol HomePresenterProtocol: AnyObject{
    
    func fetchAllPostsByUser(idUser: Int)
    
}

protocol HomeRouterProtocol{
    
}

protocol HomeInteractorProtocol{
    
    func getAllPostsByUser(idUser: Int)
    
}



