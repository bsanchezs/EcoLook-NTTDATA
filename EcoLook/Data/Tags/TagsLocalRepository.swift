//
//  TagsLocalRepository.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 15/07/22.
//

import Foundation

class TagsLocalRepository: TagsRepository {
    
    func getAllTags(success: @escaping ([Tag]?) -> Void, failure: @escaping (Error?) -> Void) {
        
        guard let data = loadJSONfile("tags_success") else { fatalError("")}
        
        let decoder = JSONDecoder()
        let response = try? decoder.decode([Tag].self, from: data)
        success(response)
        
    }
    
}

extension TagsLocalRepository {
    
    func loadJSONfile(_ name: String) -> Data? {
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else { return nil }
        
        return try? Data(contentsOf: url)
        
    }
    
}
