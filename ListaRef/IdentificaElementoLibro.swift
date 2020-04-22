//
//  IdentificaElementoLibro.swift
//  ListaRef
//
//  Created by user162514 on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class IdentificaElementoLibro: NSObject {

    var refLibro : ReferenciaLibro
    var respuesta : String = ""
    var op1 : String = ""
    var op2 : String = ""
    var op3 : String = ""
    var op4 : String = ""

    init(refLibro: ReferenciaLibro){
      self.refLibro = refLibro
    }
    
    func creaPreguntaLibro() -> String{
      var pregunta = "¿Que elemento de la ficha es este? "
      let random = Int.random(in: 1...5)
      switch random{
        case 1:
          pregunta += refLibro.autor
          respuesta = "autor"
        case 2:
          pregunta += refLibro.aPublicacion
          respuesta = "aPublicacion"
        case 3:
          pregunta += refLibro.titulo
          respuesta = "titulo"
        case 4:
          pregunta += refLibro.ciudadPais
          respuesta = "ciudad y pais"
        case 5:
          pregunta += refLibro.editorial
          respuesta = "editorial"
        default:
          pregunta = "error"
      }
      return pregunta
    }

    func creaOpciones(){
      var opciones = ["autor", "titulo", "ciudad y pais", "editorial", "aPublicacion"]

      if let index = opciones.firstIndex(of: respuesta) {
       opciones.remove(at: index)
      }

      opciones.shuffle()
      let random = Int.random(in: 0...3)
      opciones[random] = respuesta
      op1 = opciones[0]
      op2 = opciones[1]
      op3 = opciones[2]
      op4 = opciones[3]
    }

    func checaRespuesta(r: String){
      if r == respuesta{
        print("respuesta correcta")
      }else{
        print("respuesta incorrecta")
        print("respuesta esperada: " + respuesta)
      }

    }

}
