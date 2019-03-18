//
//  CarrViewController.swift
//  CarritoDeComprasP1
//
//  Created by Ruben Francisco Romero Aguado on 3/17/19.
//  Copyright © 2019 Ruben Francisco Romero Aguado. All rights reserved.
//

import UIKit

class CarrViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var back: UIButton!
    var firstViewController: ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        tabla.delegate = self
        tabla.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (firstViewController?.buy.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "celda")
     
        let articleTot = (firstViewController?.buy[indexPath.row].price)! * Double((firstViewController?.buy[indexPath.row].qty)!)
        cell.textLabel?.text = String((firstViewController?.buy[indexPath.row].qty)!) + " " + (firstViewController?.buy[indexPath.row].name)!
        cell.detailTextLabel?.text = "----------- Precio: " + String(articleTot)
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Borar") { (action, sourceView, completionHandler) in
            self.firstViewController?.buy.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
    @IBAction func cerrar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
