//
//  TagsRepository.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 15/07/22.
//

import Foundation

protocol TagsRepository {
    
    func getAllTags(success: @escaping ([Tag]?) -> Void, failure: @escaping (Error?) -> Void)
    
}
