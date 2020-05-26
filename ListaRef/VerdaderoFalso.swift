//
//  VerdaderoFalso.swift
//  ListaRef
//
//  Created by Rogelio Martinez on 5/24/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class VerdaderoFalso: NSObject {

    var ref : Referencia
    var respuesta : String = ""

    init(ref: Referencia){
      self.ref = ref
    }

    func creaPregunta() -> String{
      var pregunta = ""
      let random = Int.random(in: 0..<ref.partes.count)
      let vof = Int.random(in: 0...1)
      var random2 : Int = -1

      if vof == 1{
        random2 = random
      }else{
        repeat{
          random2 = Int.random(in: 0..<ref.partes.count)
        }while random == random2
      }
      
      respuesta = ref.partes[random]
      pregunta = "El elemento, " + ref.elementos[random] + " representa: " + ref.partes[random2]

      if random == random2{
        respuesta = "Verdadero"
      }else{
        respuesta = "Falso"
      }

      return pregunta
    }

    
}
