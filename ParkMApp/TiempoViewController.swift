//
//  TiempoViewController.swift
//  ParkMApp
//
//  Created by CICE on 28/9/18.
//  Copyright © 2018 CICE. All rights reserved.
//

import UIKit
import UserNotifications

class TiempoViewController: UIViewController {
    
    var dia: Int?
    var mes: Int?
    var año: Int?

    var hora: Int?
    var minuto: Int?
    var segundo: Int?
    
    @IBOutlet weak var tiempoPicker: UIDatePicker!
    
    @IBAction func tiempoPicker(_ sender: Any) {
        let fecha = Date()
        let calendario = Calendar.current
        
        dia = calendario.component(.day, from: fecha)
        mes = calendario.component(.month, from: fecha)
        año = calendario.component(.year, from: fecha)
        
        //hora = calendario.component(.hour, from: fecha)
        minuto = calendario.component(.minute, from: fecha)
        
        //tiempoTextField.text = String(hora!) + String(minuto!)
    }
    
    
    @IBOutlet weak var tiempoTextField: UITextField!
    
    @IBAction func guardarButton(_ sender: Any) {
        // Se guardan fecha y hora con persistencia de datos
        // Se guardan las variables con userDefaults
        
        
        let defaults = UserDefaults.standard
        defaults.set(dia, forKey: "dia")
        defaults.set(mes, forKey: "mes")
        defaults.set(año, forKey: "año")
        
        defaults.set(hora, forKey: "hora")
        defaults.set(minuto, forKey: "minuto")
        
        let fecha = Date()
        let calendario = Calendar.current
        hora = calendario.component(.hour, from: fecha)
        minuto = calendario.component(.minute, from: fecha)
        dia = calendario.component(.day, from: fecha)
        mes = calendario.component(.month, from: fecha)
        año = calendario.component(.year, from: fecha)
        segundo = calendario.component(.second, from: fecha)
        
        tiempoTextField.text = String(dia!) + "/" + String(mes!) + "/" + String(año!) + "   " + String(hora!) + ":" + String(minuto!) + ":" + String(segundo!)
        print(String(hora!)+":"+String(+minuto!) + ":" + String(segundo!))
        
    }
    
    
    // Se guarda la hora seleccionada
    
    // Notificaciones: Cuando falte x minutos se lanza una notificacion
    // Resta continuamente hora actual - hora almacenada
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tiempoPicker.addTarget(self, action: #selector(tiempoPickerChanged(sender:)), for: UIControlEvents.valueChanged)
    }
    
    
    @objc func tiempoPickerChanged(sender: UIDatePicker) {

        let fecha = Date()
        let calendario = Calendar.current

        dia = calendario.component(.day, from: fecha)
        mes = calendario.component(.month, from: fecha)
        año = calendario.component(.year, from: fecha)
        
        //hora = calendario.component(.hour, from: fecha)
        minuto = calendario.component(.minute, from: fecha)
    
        //tiempoTextField.text = String(hora!) + String(minuto!)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
