//
//  resumenViewController.swift
//  ParkMApp
//
//  Created by CICE on 28/9/18.
//  Copyright © 2018 CICE. All rights reserved.
//

import UIKit
import MapKit

class resumenViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapview: MKMapView!
    
    let locationManager = CLLocationManager()
    //var currentPlacemark: CLPlacemark?
    
    var currentTransportType = MKDirectionsTransportType.walking
    var currentRute: MKRoute?
    
    /*---------------------------*/
    //sección provisional hasta que me envien los datos
    let latitude:CLLocationDegrees = 40.7828647
    let longitude:CLLocationDegrees = -73.9653551
    let latDelta:CLLocationDegrees = 0.01
    let longDelta:CLLocationDegrees = 0.01
    
    var carLocation: CLLocation?
    /*--------------------------*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        
        if status == CLAuthorizationStatus.authorizedWhenInUse{
            mapview.showsUserLocation = true
            print(mapview.userLocation)
        }
        
        /*--------Temporal section---------*/
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapview.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Mi coche"
        
        mapview.addAnnotation(annotation)
        /*--------Temporal section---------*/
        
        
        mapview.delegate = self
        if #available(iOS 9.0, *) {
            mapview.showsCompass = true
            mapview.showsScale = true
            mapview.showsTraffic = true
        }
        
    }

    @IBAction func showRoute(_ sender: Any) {
        //establecer punto de salida y llegada
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem.forCurrentLocation()
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2DMake(latitude, longitude))
        directionRequest.destination = MKMapItem(placemark: placemark)
        directionRequest.transportType = currentTransportType
        
        //calcular la dirección
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (routeResponse, routeError) in
            guard let routeResponse = routeResponse else{
                if let routeError = routeError{
                    print("Error\(routeError)")
                }
                return
            }
            let route = routeResponse.routes[0]
            self.currentRute = route
            self.mapview.removeOverlays(self.mapview.overlays)
            self.mapview.add(route.polyline, level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            print(rect)
            self.mapview.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 3.0
        
        return renderer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
