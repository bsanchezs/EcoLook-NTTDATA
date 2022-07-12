//
//  NetworkingImagesByUrl.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 11/07/22.
//

import Foundation

class NetworkingImagesByUrl: NetworkingImages {

    func getImageByUrl(url: String, success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                  
                success(data)
                
            }else{
                
                failure(error)
                
            }
            
        }

        task.resume()
        
        
    }
    
}
