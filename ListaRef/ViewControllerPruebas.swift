//
//  ViewControllerPruebas.swift
//  ListaRef
//
//  Created by Eugenio on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class ViewControllerPruebas: UIViewController {
    
    var autores = ["Villa, P.", "Juan, C.", "Persona, A"]
    var titulos = ["Titulo1", "Titulo2", "Titulo3"]
    var aPublicacion = ["(1999)", "(2000)", "(2001)"]
    var ciudadesPaises = ["Monterrey, Mexico", "Paris, Francia", "Ciudad1, Pais1"]
    var editoriales = ["Ed1", "Editorial2", "Una Editorial"]
    
    var respuesta : String!
    var respuestaE : String!

    @IBOutlet weak var lbDatos: UILabel!
    @IBOutlet weak var lbPregunta: UILabel!
    
    
    @IBOutlet weak var btOp1: UIButton!
    @IBOutlet weak var btOp2: UIButton!
    @IBOutlet weak var btOp3: UIButton!
    @IBOutlet weak var btOp4: UIButton!
    @IBOutlet weak var btOk: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ini()
    }
    
    func ini(){
        autores.shuffle()
        titulos.shuffle()
        aPublicacion.shuffle()
        ciudadesPaises.shuffle()
        editoriales.shuffle()
        
        let ref = ReferenciaLibro(autor: autores[0], titulo: titulos[0], aPublicacion: aPublicacion[0], ciudadPais: ciudadesPaises[0], editorial: editoriales[0])
        
        let iE = IdentificaElementoLibro(refLibro: ref)
        
        lbPregunta.text = iE.creaPreguntaLibro()
        lbDatos.text = iE.refLibro.printReferencia()
        iE.creaOpciones()
        respuestaE = iE.respuesta
        btOp1.setTitle(iE.op1, for: .normal)
        btOp2.setTitle(iE.op2, for: .normal)
        btOp3.setTitle(iE.op3, for: .normal)
        btOp4.setTitle(iE.op4, for: .normal)
        btOp1.backgroundColor = UIColor.gray
        btOp2.backgroundColor = UIColor.gray
        btOp3.backgroundColor = UIColor.gray
        btOp4.backgroundColor = UIColor.gray
    }

    @IBAction func btOp1(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btOp1.backgroundColor = UIColor.green
        btOp2.backgroundColor = UIColor.gray
        btOp3.backgroundColor = UIColor.gray
        btOp4.backgroundColor = UIColor.gray
    }
    
    @IBAction func btOp2(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btOp1.backgroundColor = UIColor.gray
        btOp2.backgroundColor = UIColor.green
        btOp3.backgroundColor = UIColor.gray
        btOp4.backgroundColor = UIColor.gray
        
    }
    
    @IBAction func btOp3(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btOp1.backgroundColor = UIColor.gray
        btOp2.backgroundColor = UIColor.gray
        btOp3.backgroundColor = UIColor.green
        btOp4.backgroundColor = UIColor.gray
    }
    
    @IBAction func btOp4(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btOp1.backgroundColor = UIColor.gray
        btOp2.backgroundColor = UIColor.gray
        btOp3.backgroundColor = UIColor.gray
        btOp4.backgroundColor = UIColor.green
    }
    
    @IBAction func btOk(_ sender: UIButton) {
        if checaRespuesta(r: respuesta){
            let alerta = UIAlertController(title: "Correcto", message: "Respuesta Correcta", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            print("Respuesta Correcta")
            ini()
        }else{
            let alerta = UIAlertController(title: "Incorrecto", message: "Respuesta Correcta: " + respuesta, preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            print("Respuesta Incorreta")
            ini()
        }
    }
    
    func checaRespuesta(r: String) -> Bool{
      if r == respuestaE{
        return true
      }else{
        return false
      }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
