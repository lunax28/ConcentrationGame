//
//  ViewController.swift
//  Concentration
//
//  Created by Equilibrium on 18/06/2019.
//  Copyright © 2019 Equilibrium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //this is the link between the controller and the model
    lazy var game = Concentration(numerOfPairsOfCards: cardButtons.count/2)


    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    //var emojiChoices = ["🎃","👻","🎃","👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //flipCountLabel.text = "Flips: \(flipCount)"
        //print("agh! a ghost!")
        //flipCard(withEmoji: "👻", on: sender)
        
        if let cardNumber = cardButtons.index(of: sender){
            //print("cardNumber = \(cardNumber)")
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            //Now you shoud update your view from the model
            updateViewFromModel()
        } else{
            print("chosen card was not in cardButtons")
        }
        
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            //this is so the button matches the card
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0): #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    
    //var emoji = Dictionary<Int, String>()
    var emoji = [Int:String]()
    
    /* func emoji (for card: Card) -> String {
        let chosenEmoji = emoji[card.identifier]
        return "?"
     }*/
    
    /* func emoji (for card: Card) -> String {
        if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        }
        
    } */
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                    emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        
        
        return emoji[card.identifier] ?? "?"
    }
}

