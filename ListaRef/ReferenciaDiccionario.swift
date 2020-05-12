//
//  ReferenciaDiccionario.swift
//  ListaRef
//
//  Created by user162514 on 5/12/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class ReferenciaDiccionario: Referencia{
  
  var tituloDiccionario : String
  var aPublicacion : String
  var ciudad : String
  var editorial : String
  var pagina : String

  init(autor: String, titulo: String, aPublicacion: String, ciudad: String, editorial: String, tituloDiccionario: String, pagina: String){
    self.aPublicacion = aPublicacion
    self.ciudad = ciudad
    self.pagina = pagina
    self.tituloDiccionario = tituloDiccionario
    self.editorial = editorial

    super.init(autor: autor, titulo: titulo)

    partes = ["Autor", "Titulo", "Fecha", "Ciudad", "Editorial", "Diccionario", "Pagina"]
    elementos = [autor, titulo, aPublicacion, ciudad, editorial, tituloDiccionario, pagina]
  }

  override func printReferencia() -> String{
    let referencia = autor + " " + aPublicacion + ". " + titulo + ". En " + tituloDiccionario + " " + pagina + ". " + ciudad + ": " + editorial + "."
    return referencia;
  }

}
