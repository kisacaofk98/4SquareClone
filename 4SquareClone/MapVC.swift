//
//  MapVC.swift
//  4SquareClone
//
//  Created by Omer Keskin on 3.04.2024.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(saveClicked))
        
        
    }
    
    @objc func saveClicked(){
        
        
    }

}
