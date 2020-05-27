//
//  ViewControllerGuia.swift
//  ListaRef
//
//  Created by Eugenio on 4/22/20.
//  Copyright © 2020 Eugenio González. All rights reserved.
//

import UIKit
import PDFKit

class ViewControllerGuia: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "Guia"
        
        // Add PDFView to view controller.
        let pdfView = PDFView(frame: self.view.bounds)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(pdfView)
        
        // Fit content in PDFView.
        pdfView.autoScales = true
        
        // Load Sample.pdf file from app bundle.
        let fileURL = Bundle.main.url(forResource: "altres_a2016_guia_elaborar_citas", withExtension: "pdf")
        pdfView.document = PDFDocument(url: fileURL!)
        
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
