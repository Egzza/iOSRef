//
//  ReferenciaRevista.swift
//  ListaRef
//
//  Created by user162514 on 5/12/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class ReferenciaRevista: Referencia{
  
  var aPublicacion : String
  var tituloRevista : String
  var numeroPublicacion : String
  var paginas : String

  init(autor: String, titulo: String, aPublicacion: String, tituloRevista : String, numeroPublicacion : String, paginas : String){
    self.aPublicacion = aPublicacion
    self.tituloRevista = tituloRevista
    self.numeroPublicacion = numeroPublicacion
    self.paginas = paginas

    super.init(autor: autor, titulo: titulo)

    partes = ["Autor", "Titulo", "Fecha", "Titulo de Revista", "Numero de Publicacion", "Paginas"]
    elementos = [autor, titulo, aPublicacion, tituloRevista, numeroPublicacion, paginas]
  }

  override func printReferencia() -> String{
    let referencia = autor + " " + aPublicacion + ". " + titulo + ". " +  tituloRevista + ", " + numeroPublicacion + ", " + paginas + "."
    return referencia;
  }

}
