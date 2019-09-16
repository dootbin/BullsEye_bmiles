//
//  ViewController.swift
//  BullsEye_bmiles
//
//  Created by dootbin on 1/22/19.
//  Copyright © 2019 CVTC Benjamin Miles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0

    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    @IBAction func startNewGame(_ sender: UIButton) {
        startNewGame()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 13, bottom: 0, right: 13)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for:  .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            if difference == 1 {
                points += 50
            }
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close.. "
        }
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(slider.value)")
        
    }
    
    // startNewGame will start a new game.
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    // startNewRound will start a new round
    func startNewRound() {
        targetValue = generateRandom()
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        round += 1
    }
    
    func updateLabels() {
        targetLable.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    // generateRandom generates a random number between 1 and 100
    func generateRandom() -> Int {
        return Int.random(in: 1...100)
    }
    
}

