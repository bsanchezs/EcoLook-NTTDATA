//
//  File.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 26/06/22.
//

import Foundation

struct Post {
    
    let idPublicacion: Int
    let titulo: String
    let descripcion: String
    let nivelRiesgo: Int
    let latitud: Double?
    let longitud: Double?
    let imagen: String?
    let fecha: String
    let idUsuario: Int
    let estado: Int
    
    
    init (idPublicacion: Int, titulo: String, descripcion: String, nivelRiesgo: Int, fecha: String, idUsuario: Int){
        
        self.idPublicacion = idPublicacion
        self.titulo = titulo
        self.descripcion = descripcion
        self.nivelRiesgo = nivelRiesgo
        self.latitud = nil
        self.longitud = nil
        self.imagen = nil
        self.fecha = fecha
        self.idUsuario = idUsuario
        self.estado = 1
    }
    
    func getShortDescription(descripcion: String) -> String{
        
        if descripcion.count > 25 {
            return (String(descripcion.prefix(24))) + ".."
        }else{
            return descripcion
        }
        
    }
    
}


let arrayMockPosts = [

    Post(idPublicacion: 1, titulo: "Publicacion 1", descripcion: "Primera descripcion", nivelRiesgo: 3, fecha: "10/02/2021", idUsuario: 1),
    Post(idPublicacion: 2, titulo: "Publicacion 2", descripcion: "Segunda descripcion", nivelRiesgo: 1, fecha: "11/02/2021", idUsuario: 1),
    Post(idPublicacion: 3, titulo: "Publicacion 3", descripcion: "Tercera descripcion", nivelRiesgo: 4, fecha: "11/02/2021", idUsuario: 1),
    Post(idPublicacion: 4, titulo: "Publicacion 4", descripcion: "Cuarta descripcion", nivelRiesgo: 2, fecha: "12/02/2021", idUsuario: 1),

]

