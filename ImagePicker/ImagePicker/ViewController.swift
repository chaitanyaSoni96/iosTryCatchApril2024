//
//  ViewController.swift
//  ImagePicker
//
//  Created by Chaitanya Soni on 02/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pickImageTapped(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imageView.image = nil
        picker.dismiss(animated: true)
    }
}
extension ViewController: UINavigationControllerDelegate {
    
}
