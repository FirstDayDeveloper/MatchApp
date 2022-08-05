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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        
        // TODO: Finish configuring the cell
        
        // return it
        
        return cell
    }
}

