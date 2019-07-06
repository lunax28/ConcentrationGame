//
//  ViewController.swift
//  Concentration
//
//  Created by Equilibrium on 18/06/2019.
//  Copyright © 2019 Equilibrium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //flipCountLabel.text = "Flips: \(flipCount)"
        //print("agh! a ghost!")
        //flipCard(withEmoji: "👻", on: sender)
        
        if let cardNumber = cardButtons.index(of: sender){
            //print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else{
            print("chosen card was not in cardButtons")
        }
        
    }
    
    /* @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCount += 1
        flipCountLabel.text = "Flips: \(flipCount)"
        flipCard(withEmoji: "🎃", on: sender)
        
    }*/
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }

    
}

