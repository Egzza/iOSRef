//
//  Referencia.swift
//  ListaRef
//
//  Created by Rogelio Martinez on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class Referencia: Codable{

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
      case "Libro":
        partes = ["autor", "aPublicacion", "titulo", "edicion","ciudadPais", "editorial"]
        elementos = [autor, aPublicacion,titulo, edicion, ciudadPais, editorial]
        
      case "Libro Electronico":
        partes = ["autor", "titulo", "aPublicacion", "url"]
        elementos = [autor, titulo, aPublicacion, url]
        
        
      case "Capitulo Libro":
        partes = ["autor", "aPublicacion","titulo", "tituloMayor", "paginas", "ciudadPais", "editorial", "editores"]
        elementos = [autor, aPublicacion,  titulo, tituloMayor, paginas, ciudadPais, editorial, editores]
        
    case "Revista":
        partes = ["autor", "aPublicacion", "titulo", "tituloMayor", "edicion", "paginas"]
        elementos = [autor, aPublicacion, titulo, tituloMayor, edicion, paginas]
        
    case "Revista Electronica":
        partes = ["autor", "aPublicacion","titulo", "tituloMayor", "edicion", "paginas", "url"]
        elementos = [autor, aPublicacion, titulo, tituloMayor, edicion, paginas, url]
    
    case "Articulo Internet":
        partes = ["autor", "aPublicacion", "titulo", "url"]
        elementos = [autor, aPublicacion, titulo, url]
        
    case "Articulo Periodico":
        partes = ["autor", "titulo", "aPublicacion", "tituloMayor", "paginas"]
        elementos = [autor, titulo, aPublicacion, tituloMayor, paginas]
    
        
    case "Video":
        partes = ["autor", "aPublicacion", "titulo", "url"]
        elementos = [autor, aPublicacion, titulo, url]
 
    case "Pagina Web":
        partes = ["autor", "aPublicacion", "titulo", "url"]
        elementos = [autor, aPublicacion, titulo, url]

    case "Red Social":
        partes = ["autor", "aPublicacion", "titulo", "url"]
        elementos = [autor, aPublicacion, titulo, url]
       
        
      default:
        partes = []
        elementos = []
    }

  }

  func printReferencia() -> String{
    switch self.tipo {
      case "Libro":
        let referencia = autor + ", " + aPublicacion + ", " + titulo + ", " +  ciudadPais + ", " + editorial + ". ";
        return referencia;
    case "Libro Electronico":
        let referencia = autor + " " + aPublicacion + " " + titulo + " Recuperado de: " + url
        return referencia;
    case "Capitulo Libro":
        let referencia = autor + " " + aPublicacion + ", " + titulo + "En " +  editores + ", " + tituloMayor + " " + paginas + ". " + ciudadPais + ": " + editorial + ".";
        return referencia;
    case "Revista":
        let referencia = autor + " " + aPublicacion + " " + titulo + " " +  tituloMayor + ", " + edicion + ", " + paginas + "."
        return referencia;
    case "Revista Electronica":
        let referencia = autor + " " + aPublicacion + " " + titulo + " " +  tituloMayor + ", " + edicion + ", " + paginas + " Recuperado de: " + url
        return referencia;
        
    case "Articulo Internet":
        let referencia = autor + " " + aPublicacion + " " + titulo + " " +  " Recuperado de: " + url
        return referencia
           
            
    case "Articulo Periodico":
        let referencia = autor + " " + aPublicacion + " " + titulo + " " +  tituloMayor + ", " + paginas + "."
        return referencia
        
      case "Pagina Web":
        let referencia = autor + " " + aPublicacion + " " + titulo + " Recuperado de: " + url
        return referencia;
      case "Red Social":
        let referencia = autor + " " + aPublicacion + " " + titulo + " " + url
        return referencia;
        
    case "Video":
        let referencia = autor + " " + aPublicacion + " " + titulo + " " + url
        return referencia;
        
      default:
        print("tipo de referencia incorrecto")
        return "error en printReferencia"
        
    }
