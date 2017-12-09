//
//  Beer.swift
//  rm30479
//
//  Created by ABC Education on 07/12/2017.
//  Copyright © 2017 PunkBeer. All rights reserved.
//

import Foundation
class Beer {
    
    var id: Int?
    var nome: String?
    var tag: String?
    var descricao: String?
    var teor: Double?
    var amargura: Double?
    var imageURL: String?
    
    init(id: Int, nome: String, tag: String, descricao: String, teor: Double, amargura: Double, imagemURL: String) {
        self.id = id
        self.imageURL = imagemURL
        self.nome = nome
        self.teor = teor
        self.tag = tag
        self.amargura = amargura
        self.descricao = descricao
    }
}
