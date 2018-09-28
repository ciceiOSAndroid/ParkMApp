//
//  MapViewController.swift
//  ParkMApp
//
//  Created by CICE on 28/9/18.
//  Copyright © 2018 CICE. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    //Outlets
    @IBOutlet weak var Map: MKMapView!    
    @IBOutlet weak var infoLocation: UILabel!
    
    //Variables
    let annotation = MKPointAnnotation()
    let locationManager = CLLocationManager()
    var currentPlacemark: CLPlacemark?
    var currentTransportType = MKDirectionsTransportType.walking
    var currentRute: MKRoute?
    var longPressR: UILongPressGestureRecognizer? = nil
    
    var coordenadasMapa: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        longPressR = UILongPressGestureRecognizer(target: self, action: #selector(addChincheta))
        Map.addGestureRecognizer(longPressR!)
        

        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        
        if status == CLAuthorizationStatus.authorizedWhenInUse{
            Map.showsUserLocation = true
            print(Map.userLocation)
            
            
        }
        
    }
        
        
        @objc func addChincheta() {
            print("Mapa apretado")
            
            let touchPoint = longPressR?.location(in: Map)
            let newCoordinates = Map.convert(touchPoint!, toCoordinateFrom: Map)
            annotation.title = "Prueba"
            annotation.coordinate = newCoordinates
            
            coordenadasMapa = CLLocationCoordinate2D(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude)
            
            
            Map.addAnnotation(annotation)
        }
        
       
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // Creamos un identificador para la chincheta
            let identifier = "MiChincheta"
            
            //Comprobamos si la chincheta es la de la localización del usuario
            if annotation.isKind(of: MKUserLocation.self) {
                //Si es la chincheta del usuario, no la queremos modificar
                //Devolvemos un nil
                return nil
            }
            
            //Modificamos el resto de chinchetas
            //Creamos un objeto MKPinAnnotationView
            var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
            
            //Comprobamos si existe el objeto
            if annotationView == nil {
                //Creamos el objeto si no existe
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.animatesDrop = true
            }
            
            //Defino las características de las chinchetas
            /*
             let imagenRestauranteBurbuja = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
             imagenRestauranteBurbuja.image = UIImage(named: restaurant.image)
             annotationView?.leftCalloutAccessoryView = imagenRestauranteBurbuja
             */
            
            return annotationView
        }
        
        
    
    
    @IBAction func saveSpot(_ sender: Any) {
        
        
        
        
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueCoordenadas" {
            let destinationVC = segue.destination as! TiempoViewController
            destinationVC.coordenadasMapa = coordenadasMapa
        }
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    

}
