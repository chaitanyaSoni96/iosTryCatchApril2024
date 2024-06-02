//
//  ViewController.swift
//  ImagePicker
//
//  Created by Chaitanya Soni on 02/06/24.
//

import UIKit
import Photos
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet weak var imagePickerButton: UIButton!
    @IBOutlet weak var phPickerButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [unowned self] (status) in
            DispatchQueue.main.async { [unowned self] in
//                showUI(for: status)
                let authorised = status == .authorized
                imagePickerButton.isEnabled = authorised
                phPickerButton.isEnabled = authorised
                
            }
        }
    }

    @IBAction func pickImageTapped(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    @IBAction func pickPHImageTapped(_ sender: Any) {
        
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.selectionLimit = 2
        config.selection = .ordered
        
        let picker = PHPickerViewController(configuration: config)
//        picker.
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

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        let identifiers = results.compactMap(\.assetIdentifier)
        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        fetchResult.enumerateObjects { (asset, index, stop) -> Void in
            PHImageManager.default().requestImage(for: asset,
                                                  targetSize: self.imageView.frame.size,
                                                  contentMode: PHImageContentMode.aspectFit,
                                                  options: nil) { (image: UIImage?, _: [AnyHashable : Any]?) in
                self.imageView.image = image
            }
        }
    }
}
