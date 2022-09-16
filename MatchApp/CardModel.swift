//
//  CardModel.swift
//  MatchApp
//
//  Created by Kevin Nyangena on 7/28/22.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
    // declare an amepty array to store the numbers that we have generated
        var generatedNumbers = [Int]()
        
    // declare an empty array to store all the cards
        var generatedCards = [Card]()
        
    // create new array to keep track of generated cards
        //var noRepeatArr = [Int]()
        
    // randomly generate eight pairs of cards
        while generatedNumbers.count < 8 {
    
            //get a random number
            
            let randomNumber = Int.random(in: 1...13)
            
            if generatedNumbers.contains(randomNumber) == false {
            
                // create two new card objects
                let cardOne = Card()
                let cardTwo = Card()
                
                // set their image names
                cardOne.imageName = "card\(randomNumber)"
                cardTwo.imageName = "card\(randomNumber)"
            
                // add them to the array
                generatedCards += [cardOne, cardTwo]
                
                // add this number to the list of generated numbers
                generatedNumbers.append(randomNumber)
                
                // log the random number
                print("Random number is \(randomNumber)")
                
                // print the generated cards array count
                print(generatedCards.count)
            }
        }
    
    // Randomize the cards within the array
            generatedCards.shuffle()
        
    // Return the array
        return generatedCards
    }
}
