//
//  Tags.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 25/06/22.
//

import Foundation

struct Tag: Decodable, Encodable{
    
    let id: Int
    let name: String
    let status: Int
    
    
}

var allTags: [Tag] = []


var tagsNameSelectedToFilter = Set<String>()

