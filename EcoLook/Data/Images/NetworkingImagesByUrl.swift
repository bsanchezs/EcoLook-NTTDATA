//
//  NetworkingImagesByUrl.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 11/07/22.
//

import UIKit

class NetworkingImagesByUrl: NetworkingImages {
    
    var task: URLSessionDataTask?

    func getImageByUrl(url: String, success: @escaping (UIImage) -> Void, failure: @escaping (Error?) -> Void) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        if let task = task {
            
            task.cancel()
            
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            
            success(imageFromCache)
            return
            
        }
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data, let imagen = UIImage(data: data) {
                
                imageCache.setObject(imagen, forKey: url.absoluteString as AnyObject)
                success(imagen)
                
                
            }else{
                
                failure(error)
                
            }
            
        }

        task?.resume()
        
        
    }
    
}
