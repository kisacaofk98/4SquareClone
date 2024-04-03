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

        let uploadButton = navigationController!
        uploadButton.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Upload", style: UIBarButtonItem.Style.done, target: self, action: #selector(uploadClicked))
        
       // uploadButton.navigationBar.topItem?.rightBarButtonItem?.isEnabled = false
        
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageSelect))
        imageView.addGestureRecognizer(gestureRecognizer)
        
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
    
    @objc func uploadClicked(){
        
    }
    
    
    
    @IBAction func nextClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
}
