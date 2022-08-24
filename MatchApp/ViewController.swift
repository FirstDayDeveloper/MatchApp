//
//  ViewController.swift
//  MatchApp
//
//  Created by Kevin Nyangena on 7/27/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let model = CardModel()
    var cardsArray = [Card]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       cardsArray = model.getCards()
        
        // set the view controller as the data source and the delegate of the collectionview
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
// MARK: - Collection View Delegate Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Return number of cards by pulling from the cards array
        return cardsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // Get the card from the card array
        
        let card = cardsArray[indexPath.row]
        
        // Finish configuring the cell
        cell.configureCell(card: card)
        
        // return it
        
        return cell
    }
    
    // Handling user tap events
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get a reference to the cell that was tapped
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        // Check the status of the card to determine how to flip it
        if cell?.card?.isFlipped == false {
            // Flip the card up
            cell?.flipUp()
        }
        else {
            // Flip the card down
            cell?.flipDown()
        }
       
    }
    
}

