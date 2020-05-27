//
//  ViewControllerQuiz.swift
//  ListaRef
//
//  Created by Eugenio on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit

class ViewControllerQuiz: UIViewController {
    
    
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
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view4Options.isHidden = false
        viewTF.isHidden = true
        // Do any additional setup after loading the view.
        //navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    @IBAction func btnOpt1(_ sender: UIButton) {
    }
    
    @IBAction func btnOpt2(_ sender: UIButton) {
    }
    
    @IBAction func btnOpt3(_ sender: UIButton) {
    }
    
    @IBAction func btnOpt4(_ sender: UIButton) {
    }
    
    @IBAction func btnListo4O(_ sender: UIButton) {
        print("listo4o")
    }
    
    
    @IBAction func btnTrue(_ sender: UIButton) {
    }
    
    @IBAction func btnFalse(_ sender: UIButton) {
    }
    
    @IBAction func btnListoTF(_ sender: UIButton) {
        print("listoTF")
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
