//
//  ReferenciaCapituloLibro.swift
//  ListaRef
//
//  Created by user162514 on 5/12/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class ReferenciaCapituloLibro: Referencia{
  
  var aPublicacion : String
  var ciudad : String
  var editorial : String
  var editores : String
  var tituloLibro : String
  var paginas : String


  init(autor: String, titulo: String, aPublicacion: String, ciudad: String, editorial: String, editores : String, tituloLibro : String, paginas : String){
    self.aPublicacion = aPublicacion
    self.ciudad = ciudad
    self.editorial = editorial
    self.editores = editores
    self.tituloLibro = tituloLibro
    self.paginas = paginas

    super.init(autor: autor, titulo: titulo)

    partes = ["autor", "titulo", "aPublicacion", "ciudad", "editorial", "editores", "tituloLibro", "paginas"]
    elementos = [autor, titulo, aPublicacion, ciudad, editorial, editores, tituloLibro, paginas]
  }

  override func printReferencia() -> String{
    let referencia = autor + " " + aPublicacion + ", " + titulo + " En " +  editores + ", " + tituloLibro + " " + paginas + ". " + ciudad + ": " + editorial + ".";
    return referencia;
  }

}
