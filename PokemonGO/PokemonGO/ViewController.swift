//
//  ViewController.swift
//  PokemonGO
//
//  Created by Brian Benjamin Pareja Meruvia on 5/06/17.
//  Copyright © 2017 Brian Benjamin Pareja Meruvia. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    var ubicacion = CLLocationManager()
    var contActualizaciones = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ubicacion.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapView.showsUserLocation = true
            ubicacion.startUpdatingLocation()
        }
        else{
            ubicacion.requestWhenInUseAuthorization()

        }
        mapView.showsUserLocation = true
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (contActualizaciones < 1)
        {
            let region = MKCoordinateRegionMakeWithDistance(ubicacion.location!.coordinate, 1000, 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
        }
        else{
            ubicacion.stopUpdatingLocation()
        }
        
    }
    
    @IBAction func centrarTapped(_ sender: UIButton) {
        if let coord = ubicacion.location?.coordinate{
            let region = MKCoordinateRegionMakeWithDistance(coord, 1000, 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones+=1
        }
    }
    

    

}

