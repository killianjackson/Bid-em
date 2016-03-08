//
//  NewRusheeVC.swift
//  Bid-em
//
//  Created by David Scheibe on 3/7/16.
//  Copyright © 2016 Killian Jackson. All rights reserved.
//

import UIKit

class NewRusheeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var photoLibrary: UIButton!
    
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
    
    @IBAction func saveData_andReturn(sender: AnyObject) {
        
    }
    
    func pictureTapped(gesture: UIGestureRecognizer) {
        if let picture = gesture.view as? UIImageView {
            let picker = UIImagePickerController();
            picker.delegate = self;
            picker.sourceType = .Camera;
            presentViewController(picker, animated: true, completion: nil);
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        picture.image = info [UIImagePickerControllerOriginalImage] as? UIImage; dismissViewControllerAnimated(true, completion: nil);
    }
}
