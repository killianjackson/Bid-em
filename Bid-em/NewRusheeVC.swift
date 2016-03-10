//
//  NewRusheeVC.swift
//  Bid-em
//
//  Created by David Scheibe on 3/7/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class NewRusheeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var photoLibrary: UIButton!
    @IBOutlet weak var firstNameTextField: MaterialTextField!
    @IBOutlet weak var lastNameTextField: MaterialTextField!
    @IBOutlet weak var yearTextField: MaterialTextField!
    @IBOutlet weak var majorTextField: MaterialTextField!
    @IBOutlet weak var emailTextField: MaterialTextField!
    @IBOutlet weak var phoneNumberTextField: MaterialTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let tapGesture = UITapGestureRecognizer(target: self, action: "pictureTapped:");
        picture.addGestureRecognizer(tapGesture);
        picture.userInteractionEnabled = true;
        
    }
    
    @IBAction func photoLibraryAction(sender: UIButton) {
        let picker = UIImagePickerController();
        picker.delegate = self;
        picker.sourceType = .PhotoLibrary;
        presentViewController(picker, animated: true, completion: nil);
        
    }
    
    func postToFirebase(firstName: String!, lastName: String!, year: Int!, major: String!, email: String!, phoneNumber: String!, imgURL: String!, sumRating: Double!,numRating: Double!) {
        let post: Dictionary<String, AnyObject> = [
            "firstName": firstName, "lastName": lastName, "year": year, "major": major, "email" : email, "phoneNumber":phoneNumber, "imageURL": imgURL,"sumRatings": sumRating, "numRatings": numRating]
        
        
        let firebasePost = DataService.ds.REF_RUSHEES.childByAutoId()
        print("here")
        firebasePost.setValue(post)
        
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        yearTextField.text = ""
        majorTextField.text = ""
        emailTextField.text = ""
        phoneNumberTextField.text = ""
        picture.image = UIImage(named: "camera")
    }
    
    @IBAction func saveData_andReturn(sender: AnyObject) {
        let fN = firstNameTextField.text
        let lN = lastNameTextField.text
        let yr = Int(yearTextField.text!)
        let mjr = majorTextField.text
        let eml = emailTextField.text
        let phn = phoneNumberTextField.text
        let image = picture.image
        
        let urlStr = "https://post.imageshack.us/upload_api.php"
        let url = NSURL(string: urlStr)!
        let imgData = UIImageJPEGRepresentation(image!, 0.2)!
        let keyData = "KO5VHDLZb7c1e1a8d979e3a1f0bc3c46f23b6029".dataUsingEncoding(NSUTF8StringEncoding)!
        let keyJSON = "json".dataUsingEncoding(NSUTF8StringEncoding)!
        
        Alamofire.upload(.POST, url, multipartFormData: { MultipartFormData in
            MultipartFormData.appendBodyPart(data: imgData, name: "fileupload", fileName: "image", mimeType: "image/jpg")
            MultipartFormData.appendBodyPart(data: keyData, name: "key")
            MultipartFormData.appendBodyPart(data: keyJSON, name: "format")
        })
            { encodingResult in
                
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        
                        if let info = response.result.value as? Dictionary<String,AnyObject> {
                            
                            if let links = info["links"] as? Dictionary<String,AnyObject> {
                                
                                if let imgLink = links["image_link"] as? String {
                                    
                                    self.postToFirebase(fN,lastName: lN,year: yr,major: mjr,email: eml,phoneNumber: phn,imgURL: imgLink,sumRating: 0.0,numRating: 0.0)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                case .Failure(let error):
                    print(error)
                }
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func pictureTapped(gesture: UIGestureRecognizer) {
        if let _ = gesture.view as? UIImageView {
            let picker = UIImagePickerController();
            picker.delegate = self;
            picker.sourceType = .Camera;
            presentViewController(picker, animated: true, completion: nil);
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        picture.image = info [UIImagePickerControllerOriginalImage] as? UIImage; dismissViewControllerAnimated(true, completion: nil);
        }
    
    @IBAction func cancelBtnPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
