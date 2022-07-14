//
//  File.swift
//  EcoLook
//
//  Created by Brian Antonio Sanchez Solorsano on 26/06/22.
//

import Foundation

struct Post: Decodable, Encodable {
    
    let idPublicacion: Int
    let titulo: String
    let descripcion: String
    let nivelRiesgo: Int
    let direccion: String
    let latitud: Double?
    let longitud: Double?
    let imagen: String
    let fecha: String
    let etiquetas: [Tag]?
    let idUsuario: Int
    var esFavorito: Int
    let estado: Int
    
    
    
    func getShortDescription(descripcion: String) -> String{
        
        if descripcion.count > 25 {
            return (String(descripcion.prefix(24))) + ".."
        }else{
            return descripcion
        }
        
    }
    
    func getUrlImage(imagen: String) -> String {
        
        return "https://apiecolook.improntux.online/resources/imgs/" + imagen
        
    }
    
}

extension Post {
    
    init (){
        
        self.idPublicacion = 0
        self.titulo = "Sin Titulo"
        self.descripcion = "Sin Desc"
        self.nivelRiesgo = 0
        self.direccion = ""
        self.latitud = nil
        self.longitud = nil
        self.imagen = ""
        self.fecha = "Error"
        self.etiquetas = []
        self.idUsuario = 0
        self.esFavorito = 0
        self.estado = 0
        
    }
    
    init (idPublicacion: Int, titulo: String, descripcion: String, nivelRiesgo: Int, direccion: String, imagen: String, fecha: String, arrayEtiquetas: [Tag], idUsuario: Int){
        
        self.idPublicacion = idPublicacion
        self.titulo = titulo
        self.descripcion = descripcion
        self.nivelRiesgo = nivelRiesgo
        self.direccion = direccion
        self.latitud = nil
        self.longitud = nil
        self.imagen = imagen
        self.fecha = fecha
        self.etiquetas = arrayEtiquetas
        self.idUsuario = idUsuario
        self.esFavorito = 0
        self.estado = 1
    }
    
    
}


var posts = [

    Post(idPublicacion: 1, titulo: "Publicacion 1", descripcion: "Primera descripcion", nivelRiesgo: 3, direccion: "direccion 1", imagen: "1.jpg", fecha: "10/02/2021", arrayEtiquetas: [Tag(id: 1, name: "#basura", status: 1), Tag(id: 2, name: "#plastico", status: 1)], idUsuario: 1),
    Post(idPublicacion: 2, titulo: "Publicacion 2", descripcion: "Segunda descripcion", nivelRiesgo: 1, direccion: "direccion 2", imagen: "2.jpg", fecha: "11/02/2021", arrayEtiquetas: [Tag(id: 3, name: "#playa", status: 1)], idUsuario: 1),
    Post(idPublicacion: 3, titulo: "Publicacion 3", descripcion: "Tercera descripcion", nivelRiesgo: 4, direccion: "direccion 3", imagen: "3.jpg", fecha: "11/02/2021", arrayEtiquetas: [Tag(id: 5, name: "#desechos_toxicos", status: 1), Tag(id: 1, name: "#basura", status: 1), Tag(id: 6, name: "#urgente", status: 1)], idUsuario: 1),
    Post(idPublicacion: 4, titulo: "Publicacion 4", descripcion: "Cuarta descripcion", nivelRiesgo: 2, direccion: "direccion 4", imagen: "4.jpg", fecha: "12/02/2021", arrayEtiquetas: [], idUsuario: 1),

]

