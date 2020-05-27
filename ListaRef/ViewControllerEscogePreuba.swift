//
//  ViewControllerEscogePreuba.swift
//  ListaRef
//
//  Created by Eugenio on 5/26/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class ViewControllerEscogePreuba: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vista = segue.destination as! ViewControllerPruebas
        if(segue.identifier == "ordena"){
            vista.isOrdena = true
        } else {
            vista.isOrdena = false
        }
        
    }
    

}
