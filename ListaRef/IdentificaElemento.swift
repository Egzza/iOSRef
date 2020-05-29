//
//  IdentificaElemento.swift
//  ListaRef
//
//  Created by Rogelio Martinez on 5/12/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//
// clase para crear una pregunta de tipo identifica elemento

import UIKit

class IdentificaElemento: NSObject {

    var ref : Referencia
    var respuesta : String = ""
    var op : [String] = []

    init(ref: Referencia){
      self.ref = ref
    }
    
    // se crea la pregunta 
    func creaPregunta() -> String{
      var pregunta = "¿Que elemento de la ficha es este? "
        let random = Int.random(in: 0..<ref.partes.count)

      respuesta = ref.partes[random]
      pregunta += ref.elementos[random]

      return pregunta
    }

    func creaOpciones(){
      var opciones = ref.partes!

      if let index = opciones.firstIndex(of: respuesta) {
       opciones.remove(at: index)
      }

      opciones.shuffle()
      let random = Int.random(in: 0...3)
        opciones.insert(respuesta, at: random)
      op.append(opciones[0])
      op.append(opciones[1])
      op.append(opciones[2])
      op.append(opciones[3])
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
