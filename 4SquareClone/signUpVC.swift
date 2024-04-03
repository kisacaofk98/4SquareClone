//
//  ViewController.swift
//  4SquareClone
//
//  Created by Omer Keskin on 2.04.2024.
//

import UIKit
import ParseSwift
import ParseCore


class signUpVC: UIViewController {

    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    /*    let parseObject = PFObject(className: "Fruits")
        parseObject["name"] = "apple"
        parseObject["calories"] = 100
        parseObject.saveInBackground { (success, error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            else {
                print("uploaded")
            }
        }
        
        
        let query = PFQuery(className: "Fruits")
        query.findObjectsInBackground { (objects, error) in
            if error != nil{
                print(error!.localizedDescription)
            }
            else{
                print(objects!)
            }
        } */
        
    }
    
    
    @IBAction func signinClicked(_ sender: Any) {
        
        if usernameInput.text != "" || passwordInput.text != ""{
            
            PFUser.logInWithUsername(inBackground: usernameInput.text!, password: passwordInput.text!) { (existingUser, error) in
                if error != nil{
                    self.alertFunc(alertTitle: "Sign In Error", alertMessage: error?.localizedDescription ?? "Please enter your email and password correctly")
                }
                else{
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
        }
        else{
            alertFunc(alertTitle: "Sign In Error", alertMessage: "Please enter your email and password correctly")
        }
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        
        if usernameInput.text != "" || passwordInput.text != ""{
            
            let newUser = PFUser()
            newUser.username = usernameInput.text
            newUser.password = passwordInput.text
            newUser.signUpInBackground { succes, error in
                if error != nil{
                    self.alertFunc(alertTitle: "Sign Up Error", alertMessage: error?.localizedDescription ?? "Please enter your email and password")
                }
                else{
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }
        else{
            alertFunc(alertTitle: "Sign Up Error", alertMessage: "Please enter your email and password")
        }
    }
    
    
    @objc func alertFunc(alertTitle: String, alertMessage: String){
        let warning = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        warning.addAction(okButton)
        self.present(warning, animated: true, completion: nil)
    }
    
    
}

