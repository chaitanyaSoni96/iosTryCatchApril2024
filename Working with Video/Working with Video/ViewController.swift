//
//  ViewController.swift
//  Working with Video
//
//  Created by Chaitanya Soni on 16/06/24.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var playerContainer: UIView!
    private var playerLayer: AVPlayerLayer?
    var player: AVPlayer = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let playerLayer = AVPlayerLayer(player: self.player)
        self.playerLayer = playerLayer
//        playerContainer.layer.addSublayer(playerLayer)
        playerContainer.layer.insertSublayer(playerLayer, at: 0)
        if let path = Bundle.main.path(forResource: "earth", ofType: "mp4") {
            let url = NSURL(fileURLWithPath: path)
            let playerItem = AVPlayerItem(url: url as URL)
            player.replaceCurrentItem(with: playerItem)
            player.play()
            
        }
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //Match size of view-controller
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.playerLayer?.frame = self.playerContainer.bounds
        CATransaction.commit()
    }

}

