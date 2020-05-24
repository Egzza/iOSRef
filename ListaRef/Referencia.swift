//
//  Referencia.swift
//  ListaRef
//
//  Created by user162514 on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class Referencia: NSObject{

  var tipo : String = ""

  var autor : String = ""
  var aPublicacion : String = ""
  var fechaConsulta : String = ""
  var titulo : String = ""
  var tituloMayor : String = ""
  var edicion : String = ""
  var paginas : String = ""
  var ciudadPais : String = ""
  var editorial : String = ""
  var url : String = ""
  var editores : String = ""

  var partes : [String]!
  var elementos : [String]!

  init(tipo: String, autor: String, aPublicacion: String, fechaConsulta: String, titulo: String, tituloMayor: String, edicion: String, paginas: String, ciudadPais: String, editorial: String, url: String, editores: String){

    self.tipo = tipo
    self.autor = autor
    self.aPublicacion = aPublicacion
    self.fechaConsulta = fechaConsulta
    self.titulo = titulo
    self.tituloMayor = tituloMayor
    self.edicion = edicion
    self.paginas = paginas
    self.ciudadPais = ciudadPais
    self.editorial = editorial
    self.url = url
    self.editores = editores

    switch tipo {
      case "Referencia Libro":
        partes = ["autor", "titulo", "aPublicacion", "ciudadPais", "editorial"]
        elementos = [autor, titulo, aPublicacion, ciudadPais, editorial]
      case "Referencia Libro Electronico":
        partes = ["autor", "titulo", "aPublicacion", "url"]
        elementos = [autor, titulo, aPublicacion, url]
      case "Referencia Capitulo Libro":
        partes = ["autor", "titulo", "aPublicacion", "ciudadPais", "editorial", "editores", "tituloMayor", "paginas"]
        elementos = [autor, titulo, aPublicacion, ciudadPais, editorial, editores, tituloMayor, paginas]
      case "Referencia Diccionario":
        partes = ["autor", "titulo", "aPublicacion", "ciudadPais", "editorial", "tituloMayor", "paginas"]
        elementos = [autor, titulo, aPublicacion, ciudadPais, editorial, tituloMayor, paginas]
      case "Referencia Revista":
        partes = ["autor", "titulo", "aPublicacion", "tituloMayor", "edicion", "paginas"]
        elementos = [autor, titulo, aPublicacion, tituloMayor, edicion, paginas]
      case "Referencia Revista Electronica":
        partes = ["autor", "titulo", "aPublicacion", "tituloMayor", "edicion", "paginas", "url"]
        elementos = [autor, titulo, aPublicacion, tituloMayor, edicion, paginas, url]
      case "Referencia Pagina Web":
        partes = ["autor", "titulo", "aPublicacion", "url"]
        elementos = [autor, titulo, aPublicacion, url]
      case "Referencia Red Social":
        partes = ["autor", "titulo", "aPublicacion", "url"]
        elementos = [autor, titulo, aPublicacion, url]
      default:
        partes = []
        elementos = []
    }

  }

  func printReferencia() -> String{
    switch self.tipo {
      case "Referencia Libro":
        let referencia = autor + ", " + aPublicacion + ", " + titulo + ", " +  ciudadPais + ", " + editorial + ". ";
        return referencia;
      case "Referencia Libro Electronico":
        let referencia = autor + " " + aPublicacion + " " + titulo + " Recuperado de: " + url
        return referencia;
      case "Referencia Capitulo Libro":
        let referencia = autor + " " + aPublicacion + ", " + titulo + "En " +  editores + ", " + tituloMayor + " " + paginas + ". " + ciudadPais + ": " + editorial + ".";
        return referencia;
      case "Referencia Diccionario":
        let referencia = autor + " " + aPublicacion + " " + titulo + " En " + tituloMayor + " " + paginas + " " + ciudadPais + ": " + editorial + "."
        return referencia;
      case "Referencia Revista":
        let referencia = autor + " " + aPublicacion + " " + titulo + " " +  tituloMayor + ", " + edicion + ", " + paginas + "."
        return referencia;
      case "Referencia Revista Electronica":
        let referencia = autor + " " + aPublicacion + " " + titulo + " " +  tituloMayor + ", " + edicion + ", " + paginas + " Recuperado de: " + url
        return referencia;
      case "Referencia Pagina Web":
        let referencia = autor + " " + aPublicacion + " " + titulo + " Recuperado de: " + url
        return referencia;
      case "Referencia Red Social":
        let referencia = autor + " " + aPublicacion + " " + titulo + " " + url
        return referencia;
      default:
        //print(tipo)
        return "error en printReferencia"
        
    }

  }

}




