//
//  ViewController.swift
//  MapkitPrototype
//
//  Created by Sam Rabeeh on 2016-09-19.
//  Copyright © 2016 Sam Rabeeh - RCI. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocationCoordinate2D(latitude: 38.8976763, longitude: -77.0365298)
        
        let span = MKCoordinateSpanMake(0.5, 0.5)
        let region = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "White House Brewery"
        annotation.subtitle = "The grand palace with the finest hops - Washington D.C."
        
        mapView.addAnnotation(annotation)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var mapView: MKMapView!

}

