//
//  Tags.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 25/06/22.
//

import Foundation

struct Tag{
    
    let id: Int
    let name: String
    let status: Int
    
    
}

let arrEtiquetasTotales = [
    Tag(id: 1, name: "#basura", status: 1),
    Tag(id: 2, name: "#plastico", status: 1),
    Tag(id: 3, name: "#playa", status: 1),
    Tag(id: 4, name: "#alto_riesgo", status: 1),
    Tag(id: 5, name: "#desechos_toxicos", status: 1),
    Tag(id: 6, name: "#urgente", status: 1)
]


var setTagsNameSelected = Set<String>()

