//
//  Networking.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 11/07/22.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

protocol NetworkingImages {
    
    func getImageByUrl(url: String, success: @escaping (UIImage) -> Void, failure: @escaping (Error?) -> Void)
    
}
