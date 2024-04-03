//
//  AddPlaceVC.swift
//  4SquareClone
//
//  Created by Omer Keskin on 3.04.2024.
//

import UIKit

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

     //   let uploadButton = navigationController!
      //  uploadButton.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Upload", style: UIBarButtonItem.Style.done, target: self, action: #selector(uploadClicked))
        
       // uploadButton.navigationBar.topItem?.rightBarButtonItem?.isEnabled = false
        
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageSelect))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        let keyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(keyboardGestureRecognizer)
        
    }
    
    @objc func imageSelect(){
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
 //   @objc func uploadClicked(){}
        

    
    @objc func hideKeyboard(){
        view.endEditing(true)}
    
    
    
    @IBAction func nextClicked(_ sender: Any) {
        
        if placeNameText.text != "" || placeTypeText.text != "" || commentText.text != ""{
            
            if let chosenImage = imageView.image{
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = placeNameText.text!
                placeModel.placeType = placeTypeText.text!
                placeModel.placeComment = commentText.text!
                placeModel.placeImage = chosenImage
            }
            performSegue(withIdentifier: "toMapVC", sender: nil)
            
        }
        else{
            
            let placeModelError = UIAlertController(title: "Error", message: "Please fill the place detail", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            placeModelError.addAction(okButton)
            self.present(placeModelError, animated: true, completion: nil)
            
        }
        
        
        

    }
    
}
