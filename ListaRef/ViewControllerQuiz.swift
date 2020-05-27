//
//  ViewControllerQuiz.swift
//  ListaRef
//
//  Created by Eugenio on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class ViewControllerQuiz: UIViewController {
    
    
    var respuesta : String!
    var respuestaE : String!
    var preguntas : Int!
    var preguntasTotales : Int!
    var puntuacion : Int!
    
    @IBOutlet weak var lbPregunta: UILabel!
    @IBOutlet weak var lbDatos: UILabel!
    
    
    //4Options
    @IBOutlet weak var view4Options: UIView!
    @IBOutlet weak var btnOpt1: UIButton!
    @IBOutlet weak var btnOpt2: UIButton!
    @IBOutlet weak var btnOpt3: UIButton!
    @IBOutlet weak var btnOpt4: UIButton!
    @IBOutlet weak var btnListo4O: UIButton!
    
    
    //TrueFalse
    @IBOutlet weak var viewTF: UIView!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var btnListoTF: UIButton!
    
    //OrderList
    @IBOutlet weak var viewOrderList: UIView!
    @IBOutlet weak var tvList: UITableView!
    @IBOutlet weak var btnListoOL: UIButton!
    
    var refList:[Referencia]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refList = []
        do{
            let data = try Data.init(contentsOf: dataFileURL())
            refList = try PropertyListDecoder().decode([Referencia].self, from: data)
        } catch{
            print("error")
        }
        
        
        view4Options.isHidden = true
        viewTF.isHidden = true
        lbPregunta.numberOfLines = 5
        lbPregunta.adjustsFontSizeToFitWidth = true
        lbDatos.numberOfLines = 5
        lbDatos.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
        //navigationController?.setNavigationBarHidden(false, animated: true)
        preguntas = 5
        preguntasTotales = preguntas
        puntuacion = 0
        ini()
    }
    
    // Obtener URL de plist con referencias
    func dataFileURL()->URL{
        let url = Bundle.main.url(forResource: "ref", withExtension: "plist")
        //print(url)
        return url!
    }
    
    func ini(){
        if preguntas == 0 {
            lbPregunta.text = "Has terminado el quiz."
            lbDatos.text = "Puntuacion: " + String(puntuacion) + "/" + String(preguntasTotales)
            view4Options.isHidden = true
            viewTF.isHidden = true
            return
        }
        preguntas -= 1
        let valor = Int.random(in: 0...1) // seleccionar al azar el tipo de pregunta
        if valor == 0{
            iniVF()
        }else {
            iniIE()
        }
        
    }
    
    //fucion para inicializar identificar elemento
    func iniIE(){
        respuesta = ""
        view4Options.isHidden = false
        viewTF.isHidden = true
        
        refList.shuffle()
        refList[0].crearElementos()
        
        let iE = IdentificaElemento(ref: refList[0])
        
        let numP = preguntasTotales - preguntas
        let snumP = String(numP) + ". "
        lbPregunta.text = snumP + iE.creaPregunta()
        lbDatos.text = iE.ref.printReferencia()
        iE.creaOpciones()
        respuestaE = iE.respuesta
        btnOpt1.setTitle(iE.op[0], for: .normal)
        btnOpt2.setTitle(iE.op[1], for: .normal)
        btnOpt3.setTitle(iE.op[2], for: .normal)
        btnOpt4.setTitle(iE.op[3], for: .normal)
        btnOpt1.backgroundColor = UIColor.gray
        btnOpt2.backgroundColor = UIColor.gray
        btnOpt3.backgroundColor = UIColor.gray
        btnOpt4.backgroundColor = UIColor.gray
    }
    
    //funcion para inicializar verdadero o falso
    func iniVF(){
        respuesta = ""
        view4Options.isHidden = true
        viewTF.isHidden = false
        
        refList.shuffle()
        refList[0].crearElementos()
        
        let vF = VerdaderoFalso(ref: refList[0])
        
        let numP = preguntasTotales - preguntas
        let snumP = String(numP) + ". "
        lbPregunta.text = snumP + vF.creaPregunta()
        lbDatos.text = vF.ref.printReferencia()
        
        respuestaE = vF.respuesta
        btnTrue.setTitle("Verdadero", for: .normal)
        btnFalse.setTitle("Falso", for: .normal)
        
        btnTrue.backgroundColor = UIColor.gray
        btnFalse.backgroundColor = UIColor.gray
    }
    
    @IBAction func btnOpt1(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnOpt1.backgroundColor = UIColor.green
        btnOpt2.backgroundColor = UIColor.gray
        btnOpt3.backgroundColor = UIColor.gray
        btnOpt4.backgroundColor = UIColor.gray
    }
    
    @IBAction func btnOpt2(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnOpt1.backgroundColor = UIColor.gray
        btnOpt2.backgroundColor = UIColor.green
        btnOpt3.backgroundColor = UIColor.gray
        btnOpt4.backgroundColor = UIColor.gray
    }
    
    @IBAction func btnOpt3(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnOpt1.backgroundColor = UIColor.gray
        btnOpt2.backgroundColor = UIColor.gray
        btnOpt3.backgroundColor = UIColor.green
        btnOpt4.backgroundColor = UIColor.gray
    }
    
    @IBAction func btnOpt4(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnOpt1.backgroundColor = UIColor.gray
        btnOpt2.backgroundColor = UIColor.gray
        btnOpt3.backgroundColor = UIColor.gray
        btnOpt4.backgroundColor = UIColor.green
    }
    
    @IBAction func btnListo4O(_ sender: UIButton) {
        if checaRespuesta(r: respuesta){
            let alerta = UIAlertController(title: "Correcto", message: "Respuesta Correcta", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            print("Respuesta Correcta " + respuesta)
            puntuacion += 1
            ini()
        }else{
            let alerta = UIAlertController(title: "Incorrecto", message: "Respuesta Correcta: " + respuestaE, preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            print("Respuesta Incorrecta " + respuesta)
            ini()
        }
        
    }
    
    
    @IBAction func btnTrue(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnTrue.backgroundColor = UIColor.green
        btnFalse.backgroundColor = UIColor.gray
    }
    
    @IBAction func btnFalse(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnTrue.backgroundColor = UIColor.gray
        btnFalse.backgroundColor = UIColor.green
    }
    
    @IBAction func btnListoTF(_ sender: UIButton) {
        if checaRespuesta(r: respuesta){
            let alerta = UIAlertController(title: "Correcto", message: "Respuesta Correcta", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            print("Respuesta Correcta " + respuesta)
            puntuacion += 1
            ini()
        }else{
            let alerta = UIAlertController(title: "Incorrecto", message: "Respuesta Correcta: " + respuestaE, preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            print("Respuesta Incorrecta " + respuesta)
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
