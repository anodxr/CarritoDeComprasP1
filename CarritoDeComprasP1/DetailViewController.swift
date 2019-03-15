//
//  DetailViewController.swift
//  CarritoDeComprasP1
//
//  Created by Ruben Francisco Romero Agaudo on 3/14/19.
//  Copyright © 2019 Ruben Francisco Romero Aguado. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    var detailedProduct = Product()
    @IBOutlet weak var nameProd: UILabel!
    @IBOutlet weak var imageProd: UIImageView!
    @IBOutlet weak var descriptionProd: UILabel!
    @IBOutlet weak var priceProd: UILabel!
    @IBOutlet weak var quantyProd: UITextField!
    let minProducts: Int = 1
    let maxProducts: Int = 1000
    override func viewDidLoad() {
        super.viewDidLoad()
        quantyProd.delegate = self
        loadProps()
        // Do any additional setup after loading the view.
    }
    func loadProps() {
        nameProd.text = detailedProduct.name
        imageProd.image = UIImage(named: detailedProduct.imageName)
        descriptionProd.text = detailedProduct.description
        priceProd.text = String(detailedProduct.price)
        quantyProd.text = "1"
        //mostrando solo teclado numerico
        quantyProd.keyboardType = .numberPad
        //cambiando tema del teclado
        quantyProd.keyboardAppearance = .dark
        
    
       
    }
    func convertStringToInt(numbersCadena: String) -> Int{
        var numb: Int = 0
        if(numbersCadena.isEmpty){
            numb = 0
        }
        else{
            numb = Int(numbersCadena)!
        }
        return numb
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //solo numeros
        let onlyNumbers = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        print(string)
        let numb: Int = convertStringToInt(numbersCadena: quantyProd.text!+string)
        if(numb<=maxProducts){
            return onlyNumbers.isSuperset(of: characterSet)
        }
        else{
            //quantyProd.text = "1000"
            return false
        }
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("hola")
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("holawqw")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("sss")
        return false
    }

    @IBAction func mas(_ sender: UIButton) {
        var numb: Int = convertStringToInt(numbersCadena: quantyProd.text!)
        if(numb<maxProducts){
            numb += 1
        }
        else{
            numb = maxProducts
        }
        quantyProd.text = String(numb)
        
    }
    
    @IBAction func menos(_ sender: UIButton) {
        var numb: Int = convertStringToInt(numbersCadena: quantyProd.text!)
        if(numb>minProducts){
            numb -= 1
        }
        else{
            numb = minProducts
        }
        quantyProd.text = String(numb)
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
