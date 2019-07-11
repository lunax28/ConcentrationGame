//
//  Concentration.swift
//  Concentration
//
//  Created by Equilibrium on 06/07/2019.
//  Copyright © 2019 Equilibrium. All rights reserved.
//

import Foundation


class Concentration {
    
    //var cards = Array<Card>()
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil    // not one and only ...
            } else {
                // either no card or two cards face up
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    init(numerOfPairsOfCards: Int){
        for _ in 0..<numerOfPairsOfCards{
            let card = Card()
            //Value Type!!!
            //let matchingCard = card
            cards.append(card)
            cards.append(card)
        }
        
        cards.shuffle()
        // TODO: Shuffle the cards
        
    }
    
    
    
    
}
