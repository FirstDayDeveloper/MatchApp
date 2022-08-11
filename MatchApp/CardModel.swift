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
        //var noRepeatArr = [Int]()
        
    // randomly generate eight pairs of cards
        for _ in 1...8 {
    
            //get a random number
            
            let randomNumber = Int.random(in: 1...13)
            
            // create two new card objects
            let cardOne = Card()
            let cardTwo = Card()
            
            // set their image names
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
        
            // add them to the array
            generatedCards += [cardOne, cardTwo]
            
            // log the random number
            print("Random number is \(randomNumber)")
            
            // print the generated cards array count
            print(generatedCards.count)
        
    // randomize the cards within the array
        generatedCards.shuffle()
        }
        
    // return the array
        return generatedCards
    }
}
