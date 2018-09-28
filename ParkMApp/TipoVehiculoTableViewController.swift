//
//  TipoVehiculoTableViewController.swift
//  ParkMApp
//
//  Created by CICE on 28/9/18.
//  Copyright © 2018 CICE. All rights reserved.
//
//
import UIKit

class TipoVehiculoTableViewController: UITableViewController {
    
  
    
    
    
  
   
    
   let tiposVehiculo = ["Coches","Motos","Bicicletas","Ciclomotores","Patinetes","Autobuses"]
    

    override func viewDidLoad() {
          var numeroDeVehiculos = -1
        super.viewDidLoad()
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tiposVehiculo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath) as! CeldaTableViewCell
        
        cell.nombreText.text = tiposVehiculo[indexPath.row]
        cell.imagenCelda.image = UIImage.init(named: "\(tiposVehiculo[indexPath.row])" + ".jpg")
        cell.imagenCelda.layer.cornerRadius =  cell.imagenCelda.bounds.size.width / 3.1
        
        cell.imagenCelda.layer.masksToBounds = true
        cell.backgroundColor = UIColor.darkGray
        
        return cell
    }
    
    
    
    func showAlerta() -> Bool {
        var bool = true
        
        func cancel(alertView: UIAlertAction){
            bool = false
        }
        let alerta = UIAlertController(title: "Añadir vehiculo", message: "¿Estas seguro de añadir este vehiculo?", preferredStyle: UIAlertControllerStyle.alert)
        alerta.addAction(UIAlertAction(title: "Si!", style: .default, handler: nil))
            
        
        alerta.addAction(UIAlertAction(title: "No", style: .cancel, handler: cancel ) )
        present(alerta, animated: true)
        
        return bool
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let defaults = UserDefaults.standard
        if(showAlerta()){
          
            
          /*
             numeroDeVehiculos = numeroDeVehiculos +1
            switch IndexPath.count{
            case 0 :
                defaults.set(1, forKey: "Vehiculo"+\(numeroDeVehiculos)")
                
                
            }
           */
            
        }
    }
    
    
}


/*

    
    
    let defaults = UserDefaults.standard
    let alerta = UIAlertController(title: "Añadir vehiculo", message: "¿Estas seguro de añadir este vehiculo?", preferredStyle: UIAlertControllerStyle.alert)
    alerta.addAction(UIAlertAction(title: "Si!", style: .default, handler: nil))
    alerta.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
    self.present(alerta, animated: true, completion: nil)
        
    }
       
        
   */
   
        
        
        
  
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

  


