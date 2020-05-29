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
    
    //Ordena
    @IBOutlet weak var viewOrdAcom: UIView!
    
    @IBOutlet weak var collectionV: UICollectionView!
    var ord:Ordena!
    
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
            viewOrdAcom.isHidden = true
            collectionV.isHidden = true
            return
        }
        preguntas -= 1
        let valor = Int.random(in: 0...3) // seleccionar al azar el tipo de pregunta
        if valor == 0{
            iniVF()
        }else if valor == 1{
            iniIE()
        }else if valor == 2{
            iniOrd()
        }else if valor == 3{
            iniAcom()
        }
        
    }
    
    //fucion para inicializar identificar elemento
    func iniIE(){
        respuesta = ""
        view4Options.isHidden = false
        viewTF.isHidden = true
        viewOrdAcom.isHidden = true
        collectionV.isHidden = true
        btnListo4O.isEnabled = false
        
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
        viewOrdAcom.isHidden = true
        collectionV.isHidden = true
        btnListoTF.isEnabled = false
        
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
    
    func iniOrd(){
        view4Options.isHidden = true
        viewTF.isHidden = true
        collectionV.isHidden = false
        viewOrdAcom.isHidden = false
        refList.shuffle()
        refList[0].crearElementos()
        ord = Ordena(elementos: refList[0].elementos)
        lbPregunta.text = "Ordena"
        lbDatos.text = "Ordena correctamente los datos de la referencia"
        collectionV.dragInteractionEnabled = true
        collectionV.dragDelegate = self
        collectionV.dropDelegate = self
        collectionV.reloadData()
    }
    
    func iniAcom(){
        view4Options.isHidden = true
        viewTF.isHidden = true
        collectionV.isHidden = false
        viewOrdAcom.isHidden = false
        refList.shuffle()
        for n in 0...3 {
            refList[n].crearElementos()
        }
        var listaDeRef = [refList[0].printReferencia(),refList[1].printReferencia(),refList[2].printReferencia(),refList[3].printReferencia()]
        listaDeRef.sort()
        ord = Ordena(elementos: listaDeRef)
        lbPregunta.text = "Acomoda"
        lbDatos.text = "Acomoda alfabeticamente las referencias"
        collectionV.dragInteractionEnabled = true
        collectionV.dragDelegate = self
        collectionV.dropDelegate = self
        collectionV.reloadData()
    }
    
    
    @IBAction func btnOpt1(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnListo4O.isEnabled = true
        btnOpt1.backgroundColor = UIColor.green
        btnOpt2.backgroundColor = UIColor.gray
        btnOpt3.backgroundColor = UIColor.gray
        btnOpt4.backgroundColor = UIColor.gray
    }
    
    @IBAction func btnOpt2(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnListo4O.isEnabled = true
        btnOpt1.backgroundColor = UIColor.gray
        btnOpt2.backgroundColor = UIColor.green
        btnOpt3.backgroundColor = UIColor.gray
        btnOpt4.backgroundColor = UIColor.gray
    }
    
    @IBAction func btnOpt3(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnListo4O.isEnabled = true
        btnOpt1.backgroundColor = UIColor.gray
        btnOpt2.backgroundColor = UIColor.gray
        btnOpt3.backgroundColor = UIColor.green
        btnOpt4.backgroundColor = UIColor.gray
    }
    
    @IBAction func btnOpt4(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnListo4O.isEnabled = true
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
        btnListoTF.isEnabled = true
        btnTrue.backgroundColor = UIColor.green
        btnFalse.backgroundColor = UIColor.gray
    }
    
    @IBAction func btnFalse(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
          respuesta = buttonTitle
        }
        btnListoTF.isEnabled = true
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
    
    @IBAction func ChecarOrdena(_ sender: Any) {
        if (ord.unsolved == ord.solved){
             let alerta = UIAlertController(title: "Correcto", message: "Respuesta Correcta", preferredStyle: .alert)
             let accion = UIAlertAction(title: "OK", style: .cancel, handler: nil)
             alerta.addAction(accion)
             present(alerta, animated: true, completion: nil)
            puntuacion += 1
            ini()
         }else{
           var correcta = "\n"
            for s in ord.solved {
                correcta += s + " \n\n"
            }
            let alerta = UIAlertController(title: "Incorrecto", message: "Respuesta Correcta " + correcta, preferredStyle: .alert)
             let accion = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
             alerta.addAction(accion)
             present(alerta, animated: true, completion: nil)
            ini()
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
extension ViewControllerQuiz: UICollectionViewDataSource, UICollectionViewDelegate{
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
        cell.myLabel.adjustsFontSizeToFitWidth = true
        cell.myLabel.numberOfLines = 0
        cell.myLabel.text = ord.unsolved[indexPath.item]
        cell.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        return cell
    }
    
}


extension ViewControllerQuiz : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        var customCollectionWidth: CGFloat!
        customCollectionWidth = collectionViewWidth/1 - 10
        var customCollectionHeight: CGFloat!
        customCollectionHeight = collectionView.bounds.height/CGFloat(ord.unsolved.count) - 10
        return CGSize(width: customCollectionWidth, height: customCollectionHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}

extension ViewControllerQuiz: UICollectionViewDragDelegate {
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = self.ord.unsolved[indexPath.item] // Poner el string al que le dio click para hacer drag
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = dragItem
        //collectionView.cellForItem(at: indexPath)?.layer.borderWidth = 5
        return [dragItem]
    }
}

extension ViewControllerQuiz: UICollectionViewDropDelegate {

    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        
        if collectionView.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
        //collectionView.cellForItem(at: (coordinator.items.first?.sourceIndexPath)!)?.layer.borderWidth = 0
        
        //collectionView.cellForItem(at: (coordinator.destinationIndexPath)!)?.layer.borderWidth = 0
        
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
