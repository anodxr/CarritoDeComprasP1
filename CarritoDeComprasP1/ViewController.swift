//
//  ViewController.swift
//  CarritoDeComprasP1
//
//  Created by Ruben Francisco Romero Agaudo on 3/13/19.
//  Copyright © 2019 Ruben Francisco Romero Aguado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabla: UITableView!

    var productos: [String] = ["manzana","naranja","guayaba"]
    var imagenes:  [String] = ["manzana","naranja","guayaba"]
    var descripcion:  [String] = ["manzana","naranja","guayaba"]
    var precios: [Double] = [1.0,2.3,3.3]
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
        //tambien podemos delegar los permisos de la tabla en code
        //self.tabla.delegate = self
        //self.tabla.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
       // productos.append("jjj")
        //print(productos.endIndex)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //tabla.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let cell = CustomTableViewCell(style: CustomTableViewCell.CellStyle.subtitle, reuseIdentifier: "celda")
        cell.textLabel?.text = productos [indexPath.row]
        cell.detailTextLabel?.text = productos [indexPath.row]
        cell.imageView?.image = UIImage(named: productos [indexPath.row])
        

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tabla.indexPathForSelectedRow
        if segue.identifier == "detail" {
            let detailView = segue.destination as? DetailViewController
            let selectProduct = Product(name: productos[(indexPath?.row)!], description: descripcion[(indexPath?.row)!], imageName: imagenes[(indexPath?.row)!], price: precios[(indexPath?.row)!])
            detailView?.detailedProduct = selectProduct
            //secondView?.dato = alumnos[(indexPath?.row)!]
            
        }
    }

    func setupUI(){
        tabla.separatorStyle = .none
        tabla.rowHeight = 100.0
        tabla.backgroundColor = UIColor.clear
        
        
    }
    

    

    
}

