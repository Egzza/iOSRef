//
//  ViewControllerPruebas.swift
//  ListaRef
//
//  Created by Eugenio on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class ViewControllerPruebas: UIViewController {
    
    var respuesta : String!
    var respuestaE : String!

    @IBOutlet weak var lbDatos: UILabel!
    @IBOutlet weak var lbPregunta: UILabel!
    
    // 4Options
    @IBOutlet weak var view4Options: UIView!
    @IBOutlet weak var btOp1: UIButton!
    @IBOutlet weak var btOp2: UIButton!
    @IBOutlet weak var btOp3: UIButton!
    @IBOutlet weak var btOp4: UIButton!
    @IBOutlet weak var btOk: UIButton!
    
    
    //TrueFalse
    @IBOutlet weak var viewTrueFalse: UIView!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var btnListoTF: UIButton!
    
    //OrderList
    @IBOutlet weak var viewOrderList: UIView!
    @IBOutlet weak var tvList: UITableView!
    @IBOutlet weak var btnListoOL: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ini() // inicializa una pregunta de indntifica elemento opcion multiple
    }
    
    func ini(){
        
        let ref = Referencia(tipo: "Referencia Red Social", autor: "NASA [@nasa].", aPublicacion: "(10 de abril de 2019).", fechaConsulta: "", titulo: "In a historic feat by the Event Horizon Telescope and National Science Foundation (@NSFgov), an image of a black hole [Imagen adjunta]. ", tituloMayor: "", edicion: "", paginas: "", ciudadPais: "", editorial: "", url: "Instagram. https://www.instagram.com/p/BwFQEn0j7v1/", editores: "") // una referencia de prueba
        
        var listaRef : [Referencia] = [ref]
        listaRef.shuffle()
        
        let iE = IdentificaElemento(ref: listaRef[0])
        
        lbPregunta.text = iE.creaPregunta()
        lbDatos.text = iE.ref.printReferencia()
        iE.creaOpciones()
        respuestaE = iE.respuesta
        btOp1.setTitle(iE.op[0], for: .normal)
        btOp2.setTitle(iE.op[1], for: .normal)
        btOp3.setTitle(iE.op[2], for: .normal)
        btOp4.setTitle(iE.op[3], for: .normal)
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
