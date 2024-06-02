//
//  ViewController.swift
//  EggTimer
//
//  Created by Chaitanya Soni on 02/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startTimerButton: UIButton!
    
    
    private var presetSelected: Int = 0
    
    private var cookingTimer: Timer? = nil
    
    private var secondsTimer: Timer? = nil
    private var secondsRemaining: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func startTimerTapped(_ sender: Any) {
        
        cookingTimer?.invalidate()
        secondsTimer?.invalidate()
        
        if secondsRemaining != .zero {
            
            cookingTimer = Timer.scheduledTimer(timeInterval: TimeInterval(secondsRemaining),
                                                target: self,
                                                selector: #selector(ViewController.cookingTimerFired),
                                                userInfo: nil,
                                                repeats: false)
            
            secondsTimer = Timer.scheduledTimer(timeInterval: .init(1),
                                                target: self,
                                                selector: #selector(ViewController.secondsTimerFired),
                                                userInfo: nil,
                                                repeats: true)
        }
    }
    
    @objc func cookingTimerFired() {
        self.cookingTimer?.invalidate()
        self.secondsTimer?.invalidate()
        
        self.secondsRemaining = 0
        self.timerLabel.text = self.secondsRemaining.asTimeString()
    }
    
    @objc func secondsTimerFired() {
        
        self.secondsRemaining -= 1
        let time = self.secondsRemaining.asTimeString()
        print(time)
        self.timerLabel.text = time
    }
    
    @IBAction func pauseTimerTapped(_ sender: Any) {
        
        self.cookingTimer?.invalidate()
        self.secondsTimer?.invalidate()
        
    }
    
    @IBAction func restartTimerTapped(_ sender: Any) {
        self.cookingTimer?.invalidate()
        self.secondsTimer?.invalidate()
        
        self.secondsRemaining = self.presetSelected
        self.timerLabel.text = self.secondsRemaining.asTimeString()
    }
    
    
    @IBAction func hardBoiledTapped(_ sender: Any) {
        cookingTimer?.invalidate()
        secondsTimer?.invalidate()
        let timeInterval = 10*60
        presetSelected = timeInterval
        secondsRemaining = timeInterval
        timerLabel.text = timeInterval.asTimeString()
    }
    
    @IBAction func softBoiledTapped(_ sender: Any) {
        cookingTimer?.invalidate()
        secondsTimer?.invalidate()
        let timeInterval = 8*60
        presetSelected = timeInterval
        secondsRemaining = timeInterval
        timerLabel.text = timeInterval.asTimeString()
    }
    
    @IBAction func runnyYolkTapped(_ sender: Any) {
        cookingTimer?.invalidate()
        secondsTimer?.invalidate()
        let timeInterval = 6*60
        presetSelected = timeInterval
        secondsRemaining = timeInterval
        timerLabel.text = timeInterval.asTimeString()
    }
}

