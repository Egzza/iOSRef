//
//  Referencia.swift
//  ListaRef
//
//  Created by user162514 on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class Referencia: NSObject {
    var autor : String
    var titulo : String
    var partes : [String]!
    var elementos : [String]!
    
    init(autor: String, titulo: String){
      self.autor = autor
      self.titulo = titulo
    }

    func printReferencia() -> String{
      return ""
    }
}
