//
//  Networking.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 11/07/22.
//

import Foundation

protocol NetworkingImages {
    
    func getImageByUrl(url: String, success: @escaping (Data) -> Void, failure: @escaping (Error?) -> Void)
    
}
