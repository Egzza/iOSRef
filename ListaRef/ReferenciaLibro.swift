//
//  ReferenciaLibro.swift
//  ListaRef
//
//  Created by user162514 on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class ReferenciaLibro: Referencia {

    var aPublicacion : String
    var ciudadPais : String
    var editorial : String

    init(autor: String, titulo: String, aPublicacion: String, ciudadPais: String, editorial: String){
      self.aPublicacion = aPublicacion
      self.ciudadPais = ciudadPais
      self.editorial = editorial

      super.init(autor: autor, titulo: titulo)
        
        partes = ["Autor", "Titulo", "Fecha", "Ciudad y Pais", "Editorial"]
        elementos = [autor, titulo, aPublicacion, ciudadPais, editorial]
    }

    override func printReferencia() -> String{
      let referencia = autor + ", " + aPublicacion + ", " + titulo + ", " +  ciudadPais + ", " + editorial + ". ";
      return referencia;
    }

}
