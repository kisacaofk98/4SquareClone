//
//  PlacesVC.swift
//  4SquareClone
//
//  Created by Omer Keskin on 3.04.2024.
//

import UIKit
import ParseSwift
import ParseCore

class PlacesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let currentUserName = PFUser.current()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutClicked))
        
        navigationController?.navigationBar.topItem?.prompt = PFUser.current()?.username
    }
    
    @objc func addButtonClicked() {
        
        performSegue(withIdentifier: "toAddPlaceVC", sender: nil)
    }
    
    @objc func logoutClicked(){
        
        PFUser.logOutInBackground { error in
            if error != nil{
                let logoutError = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                logoutError.addAction(okButton)
                self.present(logoutError, animated: true, completion: nil)
                
            }
            else{
                self.performSegue(withIdentifier: "toSignupVC", sender: nil)
            }
        }
        
    }

}
