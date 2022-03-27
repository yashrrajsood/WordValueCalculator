//
//  numberDetailViewController.swift
//  WordValueCalculator
//
//  Created by Yash Rraj Sood on 21/3/22.
//

import UIKit

var detailVC = numberDetailViewController()

class numberDetailViewController: UIViewController {
    @IBOutlet weak var ruilingPlantLabel: UILabel!
    @IBOutlet weak var metalLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var friendlyLabel: UILabel!
    @IBOutlet weak var numberLogo: UIImageView!
    @IBOutlet weak var enemyLabel: UILabel!
    
    let numeroIndianDictionary = [
    // Number, [Image, Ruiling Planet, Charecteritcs, Metal, Color, Friendly Numbers, Enemy Numbers, Learn More link]
        1: ["icons8-number_1",
              "Sun",
              "Leader, Independent, Proud",
              "Gold",
              "Gold",
              "1, 2, 3, 9",
              "4, 6, 8",
              "https://www.nabatara.in/number-1-in-indian-numerology/"
             ],
        2: ["icons8-number_2",
              "Moon",
              "Intuitive, Responsive, Diplomatic",
              "Silver",
              "White",
              "1, 2, 3",
              "4, 5, 8",
              "https://www.nabatara.in/number-2-in-indian-numerology/"
             ],
        3: ["icons8-number_3",
              "Jupiter",
              "Inspiring, Outgoing, Optimistic",
              "Gold",
              "Yellow",
              "1, 2, 3, 9",
              "5, 6",
              "https://www.nabatara.in/number-3-in-indian-numerology/"
             ],
        4: ["icons8-number_4",
              "Rahu",
              "Methodical, Systematic, Imaginative",
              "Gold",
              "Gold",
              "5, 6, 8",
              "1, 2, 9",
              "https://www.nabatara.in/number-4-in-indian-numerology/"
             ],
        5: ["icons8-number_5",
              "Mercury",
              "Adventurous, Clever, Freedom",
              "Gold",
              "Green",
              "1, 4, 5, 6, 8",
              "1, 2",
              "https://www.nabatara.in/number-5-in-indian-numerology/"
             ],
        6: ["icons8-number_6",
              "Venus",
              "Caring, Loving, Trustworthy",
              "Silver",
              "Silver",
              "4, 5, 6, 8",
              "1, 2",
              "https://www.nabatara.in/number-6-in-indian-numerology/"
             ],
        7: ["icons8-number_7",
              "Ketu",
              "Explorer, Philosopher, Educator",
              "White Gold",
              "White",
              "8, 6, 5",
              "1, 2, 9",
              "https://www.nabatara.in/number-7-in-indian-numerology/"
             ],
        8: ["icons8-number_8",
              "Saturn",
              "Energetic, Leader, Realist",
              "Iron",
              "Black",
              "4, 5, 6",
              "1, 2, 9",
              "https://www.nabatara.in/number-8-in-indian-numerology/"
             ],
        9: ["icons8-number_9",
              "Mars",
              "Charismatic, Artistic, Compassionate",
              "Copper",
              "Red",
              "1, 2, 3",
              "5, 4",
              "https://www.nabatara.in/number-9-in-indian-numerology/"
             ]
    ]
    
    @IBAction func learnMoreButtonClicked(_ sender: Any) {
        let tempUrl = NSURL(string:numeroIndianDictionary[numeroSingleton.shared.numero]?[7] ?? "www.google.com")! as URL
        UIApplication.shared.open(tempUrl, options: [:], completionHandler: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeDetails(received: numeroSingleton.shared.numero)
    }
    
    func changeDetails(received: Int) {
        numberLogo.image = UIImage(named: numeroIndianDictionary[received]?[0] ?? ("icons8-number_" + String(received)))
        ruilingPlantLabel.text = numeroIndianDictionary[received]![1]
        characterLabel.text = numeroIndianDictionary[received]![2]
        metalLabel.text = numeroIndianDictionary[received]![3]
        colorLabel.text = numeroIndianDictionary[received]![4]
        friendlyLabel.text = numeroIndianDictionary[received]![5]
        enemyLabel.text = numeroIndianDictionary[received]![6]
            
    }
    
}
