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
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
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

    func parseJsonData(data: NSData) -> [Beer] {
        
        let beers = [Beer]()
        
        do
        {
            let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            
            // Parse JSON data
            let jsonProductos = jsonResult?["beers"] as! [AnyObject]
            
            for jsonProducto in jsonProductos {
                
                let beer = Beer()
                beer.BreweryName = jsonProducto["id"] as! String
                beer.BeerType = jsonProducto["BeerType"] as! String
                beer.Longtitude = jsonProducto["longtitude"] as! Decimal
                beer.Latitude = jsonProducto["latitude"] as! Decimal
                
                let geoCoder = CLGeocoder()
                geoCoder.geocodeAddressString(" + beer.Latitude + ',', beer.Longitude + ", completionHandler: { placemarks, error in
                    
                    if error != nil {
                        print(error)
                        return
                    }
                    
                    if placemarks != nil && placemarks!.count > 0 {
                        
                        let placemark = placemarks?[0]
                        
                        // Add Annotation
                        let annotation = MKPointAnnotation()
                        annotation.title = beer.BarName
                        annotation.subtitle = beer.BeerType
                        annotation.coordinate = placemark!.location!.coordinate
                        
                        self.mapView.addAnnotation(annotation)
                    }
                    
                })
            }
        }
        catch let parseError {
            print(parseError)
        }
        
        return beers
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        // Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "yourImage")
        }
        
        return annotationView
    }
}

