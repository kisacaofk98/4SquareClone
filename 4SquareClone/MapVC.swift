//
//  MapVC.swift
//  4SquareClone
//
//  Created by Omer Keskin on 3.04.2024.
//

import UIKit
import MapKit
import ParseSwift
import ParseCore

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(saveClicked))
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let pinRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation))
        pinRecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(pinRecognizer)
        
        
        
        
    }
    
    @objc func chooseLocation(pinRecognizer: UILongPressGestureRecognizer){
        
        if pinRecognizer.state == .began{
            let touchedPoint = pinRecognizer.location(in: self.mapView)
            let touchedCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            PlaceModel.sharedInstance.placeLatitude = String(touchedCoordinates.latitude)
            PlaceModel.sharedInstance.placeLongitude = String(touchedCoordinates.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = String(PlaceModel.sharedInstance.placeName)
            annotation.subtitle = String(PlaceModel.sharedInstance.placeType)
            self.mapView.addAnnotation(annotation)
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        
        
    }
    
    @objc func saveClicked(){
        
        let placeModel = PlaceModel.sharedInstance
        
        let object = PFObject(className: "Places")
        object["Name"] = placeModel.placeName
        object["Type"] = placeModel.placeType
        object["Comment"] = placeModel.placeComment
        object["Latitude"] = placeModel.placeLatitude
        object["Longitude"] = placeModel.placeLongitude
        
        if let imageData = placeModel.placeImage.jpegData(compressionQuality: 1.0){
            object["Image"] = PFFileObject(name: "\(placeModel.placeName).jpg", data: imageData)
        }
        
        object.saveInBackground { (success, error) in
            if error != nil{
                
                let saveError = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                saveError.addAction(okButton)
                self.present(saveError, animated: true, completion: nil)
                
            }
            else{
                self.performSegue(withIdentifier: "fromMapVcToTableVc", sender: nil)
            }
        }
        
        
        
    }

}
