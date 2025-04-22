//
//  MUMapViewController.swift
//  MUHawksApp
//
//  Created by Joseph T. Furmanowski on 10/25/22.
//

import UIKit
import MapKit
import CoreLocation

class MUMapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    let sharedInstance = MUModel.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myMapView.delegate = self
        myMapView.mapType = .satellite
        zoomToMU()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addMULandmarks()
    }
    
    func zoomToMU() {
        let greatHall =  CLLocationCoordinate2D(latitude: 40.27989, longitude: -74.00479)
        
        let region = MKCoordinateRegion.init(center: greatHall, latitudinalMeters: 350, longitudinalMeters: 350)
            myMapView.setRegion(region, animated: true)
        
    }
    
    func addMULandmarks ()  {
        for landmark in sharedInstance.getLandmarks() {
            let annotation = MKPointAnnotation()
            let thisLandmark = CLLocation (latitude: landmark.latitude!, longitude: landmark.longitude!)
            annotation.coordinate = CLLocationCoordinate2D(latitude: thisLandmark.coordinate.latitude, longitude: thisLandmark.coordinate.longitude)
            annotation.title = landmark.name
            annotation.subtitle = "West Long Branch, NJ"
            myMapView.addAnnotation(annotation)
        }
    }
    
    @IBAction func focusMU(_ sender: UIBarButtonItem) {
        zoomToMU()
    }

}
