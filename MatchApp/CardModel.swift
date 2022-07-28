//
//  CardModel.swift
//  MatchApp
//
//  Created by Kevin Nyangena on 7/28/22.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
    // declare an empty array to store all the cards
        var generatedCards = [Card]()
        
    // create new array to keep track of generated cards
        var noRepeatArr = [Int]()
        
    // randomly generate eight pairs of cards
        while noRepeatArr.count <= 8 {
        
            // generate a random number
            let randomNumber = Int.random(in: 1...13)
            if noRepeatArr.contains(randomNumber) == false {
                noRepeatArr.append(randomNumber)
                // print(noRepeatArr)
                noRepeatArr += [randomNumber]
            }
            
        // create two new card objects
            let cardOne = Card()
            let cardTwo = Card()
            
        // set their image names
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
        
    // add them to the array
            generatedCards += [cardOne, cardTwo]
            print(randomNumber)
        
    // randomize the cards within the array
        generatedCards.shuffle()
        }
        
    // return the array
        return generatedCards
    }
}
