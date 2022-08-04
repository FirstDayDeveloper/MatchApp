//
//  ViewController.swift
//  MatchApp
//
//  Created by Kevin Nyangena on 7/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let model = CardModel()
    var cardsArray = [Card]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       cardsArray = model.getCards()
    }


}

