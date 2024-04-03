//
//  DetailVC.swift
//  4SquareClone
//
//  Created by Omer Keskin on 3.04.2024.
//

import UIKit
import MapKit

class DetailVC: UIViewController {
    
    
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeTypeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var detailsMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
