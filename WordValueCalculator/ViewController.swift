//
//  ViewController.swift
//  WordValueCalculator
//
//  Created by Yash Rraj Sood on 21/3/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var numberTotalLabel: UILabel!
    @IBOutlet weak var numerologyTotalLabel: UILabel!
    @IBOutlet weak var wordInputTextFeild: UITextField!
    
    var indianValueMap:[String:Int] = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 8, "g": 3, "h": 5, "i": 1, "j": 1, "k": 2, "l": 3, "m": 4, "n": 5, "o": 7, "p": 8, "q": 1, "r": 2, "s": 3, "t": 4, "u": 6, "v": 6, "w": 6, "x": 5, "y": 1, "z": 7]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.wordInputTextFeild.delegate = self
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red: 0.29, green: 0.42, blue: 0.72, alpha: 1.00).cgColor, UIColor(red: 0.09, green: 0.16, blue: 0.28, alpha: 1.00).cgColor]
        
        wordInputTextFeild.attributedPlaceholder = NSAttributedString(
            string: "Enter name/date here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        calculateNumericalValue()
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func calculateNumericalValue(_ sender: Any? = nil) {
        if (wordInputTextFeild.text != ""){
            let word: String = wordInputTextFeild.text ?? ""
            let lowerCasedWord = word.lowercased()
            var total = 0
            for char in lowerCasedWord{
                if char != " "{
                    total += indianValueMap[String(char)] ?? 0
                }
            }
            numberTotalLabel.text = String(total)
            singleDigitSum(received: total)
        }else{
            let alert = UIAlertController(title: "Error", message: "Please enter something in the field below", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            numberTotalLabel.text = "--"
            numerologyTotalLabel.text = "-"
        }
    }

    func singleDigitSum(received: Int){
        var sum = 0
        var n = received
        while(n > 0 || sum > 9){
            if(n == 0){
                n = sum
                sum = 0
            }
            sum += n % 10
            n /= 10
        }
        numerologyTotalLabel.text = "No." + String(sum)
    }
    
    
    
    
}
