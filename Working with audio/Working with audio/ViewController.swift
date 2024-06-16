//
//  ViewController.swift
//  Working with audio
//
//  Created by Chaitanya Soni on 16/06/24.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playTapped(_ sender: Any) {
        let path = Bundle.main.path(forResource: "flow", ofType: "mp3")
        let fileURL = NSURL(fileURLWithPath: path ?? "")
        
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try? AVAudioSession.sharedInstance().setActive(true, options: [])
        player = try? AVAudioPlayer(contentsOf: fileURL as URL)
        
        player?.play()
        
        
    }
    
}

