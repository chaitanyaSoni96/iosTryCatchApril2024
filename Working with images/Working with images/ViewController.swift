//
//  ViewController.swift
//  Working with images
//
//  Created by Chaitanya Soni on 29/06/24.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg"
        
//        if let url = URL(string: urlString) {
//            
//            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
//                if let data = data {
//                    DispatchQueue.main.async {
//                        let image = UIImage(data: data)
//                        self.imageView.image = image
//                    }
//                }
//            }
//            
//            task.resume()
//        }
        
        
        imageView.sd_setImage(with: URL(string: urlString), placeholderImage: UIImage(named: "placeholder")) { image, error, cacheType, url in
            
        }
        registerForRemoteNotification()
    }
    
    func registerForRemoteNotification() {
        let center  = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
            if error == nil{
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

}

