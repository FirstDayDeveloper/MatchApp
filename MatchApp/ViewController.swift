//
//  ViewController.swift
//  MatchApp
//
//  Created by Kevin Nyangena on 7/27/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    let model = CardModel()
    var cardsArray = [Card]()
    
    var timer:Timer?
    var milliseconds:Int = 10 * 1000
    
    var firstFlippedCardIndex:IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       cardsArray = model.getCards()
        
        // Set the view controller as the data source and the delegate of the collectionview
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Initialize the timer
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    // MARK: - Timer Methods
    
    @objc func timerFired() {
        
        // Decrement the counter
        milliseconds -= 1
        
        // Update the label
        let seconds:Double = Double(milliseconds)/1000.0
        timerLabel.text = String(format: "Time remaining: %.2f", seconds)
        
        // Stop the timer if it reaches zero
        if milliseconds == 0 {
            timerLabel.textColor = UIColor.red
            timer?.invalidate()
            
            // Check if the user has cleared all the card pairs
            checkForGameEnd()
            
        }
    }
    
    
// MARK: - Collection View Delegate Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Return number of cards by pulling from the cards array
        return cardsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // return it
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        // Configure the state of the cell based on the card that it represents
        let cardCell = cell as? CardCollectionViewCell
        
            // Get the card from the card array
        
            let card = cardsArray[indexPath.row]
        
            // Finish configuring the cell
            cardCell?.configureCell(card: card)
        
    }
    
    // Handling user tap events
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get a reference to the cell that was tapped
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        // Check the status of the card to determine how to flip it
        if cell?.card?.isFlipped == false && cell?.card?.isMatched == false {
            
            // Flip the card up
            cell?.flipUp()
            
            // Check if this if the first or second card to be flipped
        if firstFlippedCardIndex == nil {
            
            // This is the first card flipped over
            firstFlippedCardIndex = indexPath
        }
        else {
            // This is the second card flipped over
            
            // Run the comparison logic
            checkForMatch(indexPath)
        }
    }
}

    
// MARK: - Game logic methods
    
    func checkForMatch(_ secondFlippedCardIndex:IndexPath) {
        
        // Get the two card objects from the two indices and see if they match
        let cardOne = cardsArray[firstFlippedCardIndex!.row]
        let cardTwo = cardsArray[secondFlippedCardIndex.row]
        
        // Get the two collection view cells that represent or hold card one and card two
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        // Compare the two cards
        if cardOne.imageName == cardTwo.imageName {
            // It's a match
            
            // Set the status and remove them
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            // Remove the cards
            cardOneCell?.removeCard()
            cardTwoCell?.removeCard()
            
            // Was that the last pair?
            checkForGameEnd()
            
        }
        else {
            // It's not a match
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            // Flip them back over
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
        }
        // Reset the firstFlippedCardIndex property
        firstFlippedCardIndex = nil
    }
    
    func checkForGameEnd() {
        
        // Check if there's any card that is unmatched
        // Assume the user has won, loop through all the cards to see if all of them are matched
        var hasWon = true
        
        for card in cardsArray {
            if card.isMatched == false {
                // We've found a card that is unmatched
                hasWon = false
                break
            }
        }
        
        if hasWon == true {
            
            // User has won, show an alert
            showAlert(title: "Congratulations!", message: "You've won the game.")
        }
        
        else {
            // User hasn't won yet, check if there's any time left
            if milliseconds <= 0 {
                
                showAlert(title: "Time's Up!", message: "Sorry, better luck next time!")
            }
            
        }
    }
    
    func showAlert(title:String, message:String) {
        
        // Create the alert
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Add a button for the user to dismiss the alert
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertMessage.addAction(okAction)
        
        // Show the alert
        present(alertMessage, animated: true, completion: nil)
    }
}
