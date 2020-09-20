//
//  ViewController.swift
//  WarCardGame
//
//  Created by Daniel Serrano on 9/18/20.
//  Copyright © 2020 dan_uhl. All rights reserved.
//

import UIKit

// `class ViewController: UIViewController` is saying that
// `ViewController` extends `UIViewController`
class ViewController: UIViewController {

    // `@IBOutlet` means that the var references
    // an elemend on the storyboard
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
  
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBAction func dealTapped(_ sender: Any) {
        
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)

        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        if (leftNumber > rightNumber) {
            // left side wins
            leftScore += 1
            
            leftScoreLabel.text = String(leftScore)
        } else if (leftNumber < rightNumber) {
            // right side wins
            rightScore += 1
            
            rightScoreLabel.text = String(rightScore)
        } else {
            // tie
        }
        
    }
    
}

