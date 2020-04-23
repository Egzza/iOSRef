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
        btOp1.setTitle(iE.op1, for: .normal)
        btOp2.setTitle(iE.op2, for: .normal)
        btOp3.setTitle(iE.op3, for: .normal)
        btOp4.setTitle(iE.op4, for: .normal)
    }

    @IBAction func btOp1(_ sender: UIButton) {
    }
    
    @IBAction func btOp2(_ sender: UIButton) {
    }
    
    @IBAction func btOp3(_ sender: UIButton) {
    }
    
    @IBAction func btOp4(_ sender: UIButton) {
    }
    
    @IBAction func btOk(_ sender: UIButton) {
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
