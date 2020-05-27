//
//  ViewControllerPruebas.swift
//  ListaRef
//
//  Created by Eugenio on 4/22/20.
//  Modified by Rogelio Martiez
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
    var ord:Ordena!
    
    
    @IBOutlet weak var collectionV: UICollectionView!
    
    var isOrdena:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbPregunta.adjustsFontSizeToFitWidth = true
        lbPregunta.numberOfLines = 5
        lbDatos.adjustsFontSizeToFitWidth = true
        lbDatos.numberOfLines = 5
        //view4Options.isHidden = true
        //viewTrueFalse.isHidden = true
        //collectionV.isHidden = false
        if(isOrdena){
            iniOrd()
        } else{
            ini()
        }

    }
    func ini(){
        var valor = Int.random(in: 0...1) // seleccionar al azar el tipo de pregunta
        if valor == 0{
            iniVF()
        }else{
            iniIE()
        } 
    }
    
    //fucion para inicializar identificar elemento
    func iniIE(){
        respuesta = ""
        view4Options.isHidden = false
        viewTrueFalse.isHidden = true
        collectionV.isHidden = true
        let ref = Referencia(tipo: "Referencia Libro Electronico", autor: "Cervantes Barba, C.", aPublicacion: "(2001).", fechaConsulta: "", titulo: "La sociología de las noticias y el enfoque agenda-setting.", tituloMayor: "", edicion: "", paginas: "", ciudadPais: "", editorial: "", url: "http://site.ebrary.com/lib/interpuertoricosp/Doc?id=101 49393", editores: "") // una referencia de prueba
        
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
    
    //funcion para inicializar verdadero o falso
    func iniVF(){
        respuesta = ""
        view4Options.isHidden = true
        viewTrueFalse.isHidden = false
        collectionV.isHidden = true
        let ref = Referencia(tipo: "Referencia Libro Electronico", autor: "Cervantes Barba, C.", aPublicacion: "(2001).", fechaConsulta: "", titulo: "La sociología de las noticias y el enfoque agenda-setting.", tituloMayor: "", edicion: "", paginas: "", ciudadPais: "", editorial: "", url: "http://site.ebrary.com/lib/interpuertoricosp/Doc?id=101 49393", editores: "") // una referencia de prueba
        
        var listaRef : [Referencia] = [ref]
        listaRef.shuffle()
        
        let vF = VerdaderoFalso(ref: listaRef[0])
        
        lbPregunta.text = vF.creaPregunta()
        lbDatos.text = vF.ref.printReferencia()
        
        respuestaE = vF.respuesta
        btnTrue.setTitle("Verdadero", for: .normal)
        btnFalse.setTitle("Falso", for: .normal)
        
        btnTrue.backgroundColor = UIColor.gray
        btnFalse.backgroundColor = UIColor.gray
    }
    
    //funcion para inicializar ordena
    func iniOrd(){
        view4Options.isHidden = true
        viewTrueFalse.isHidden = true
        collectionV.isHidden = false
        ord = Ordena(title: "x", solvedImages: ["uno","dos","tres","cuatro","cinco"])
        collectionV.dragInteractionEnabled = true
        collectionV.dragDelegate = self
        collectionV.dropDelegate = self
        collectionV.reloadData()
    }
    
    // botones de identificar elemento
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
    
    // botones de verdadero o falso
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
    
    
    
    @IBAction func btOk(_ sender: UIButton) {
        if checaRespuesta(r: respuesta){
            let alerta = UIAlertController(title: "Correcto", message: "Respuesta Correcta", preferredStyle: .alert)
            let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            print("Respuesta Correcta " + respuesta)
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


// MARK:- Ordena
extension ViewControllerPruebas: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Agarrar la lista length
        if ord != nil{
            return ord.unsolved.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OrdenaCollectionViewCell
        // Agrega el label
        cell.myLabel.text = ord.unsolved[indexPath.item]
        return cell
    }
    
}

extension ViewControllerPruebas : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 40, left: 15, bottom: 40, right: 15)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        var customCollectionWidth: CGFloat!
        customCollectionWidth = collectionViewWidth/3 - 10
        return CGSize(width: customCollectionWidth, height: customCollectionWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewControllerPruebas: UICollectionViewDragDelegate {
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.ord.unsolved[indexPath.item] // Poner el string al que le dio click para hacer drag
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = dragItem
        return [dragItem]
    }
}

extension ViewControllerPruebas: UICollectionViewDropDelegate {

    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
        var destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }
        
        if coordinator.proposal.operation == .move {
            self.reorderItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
            collectionView.reloadData()
        }
    }
    
    fileprivate func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath:IndexPath, collectionView: UICollectionView) {
        
        if let item = coordinator.items.first,
            let sourceIndexPath = item.sourceIndexPath {
            
            collectionView.performBatchUpdates({
                ord.unsolved.swapAt(sourceIndexPath.item, destinationIndexPath.item)
                collectionView.reloadItems(at: [sourceIndexPath,destinationIndexPath])
                
            }, completion: nil)
            
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
    }
}
