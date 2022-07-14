//
//  PersonalPresenter.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 14/07/22.
//

import UIKit

class PersonalPresenter {
    
    weak var view: PersonalViewProtocol?
    var router: PersonalRouterProtocol?
    var interactor: PersonalInteractorProtocol?
    
}

extension PersonalPresenter: PersonalPresenterProtocol {
    
    
}
