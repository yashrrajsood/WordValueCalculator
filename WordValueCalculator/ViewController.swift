//
//  ViewController.swift
//  WordValueCalculator
//
//  Created by Yash Rraj Sood on 21/3/22.
//

import UIKit
//import GoogleMobileAds
//import AppTrackingTransparency
//import AdSupport


class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var numberTotalLabel: UILabel!
    @IBOutlet weak var numerologyTotalLabel: UILabel!
    @IBOutlet weak var wordInputTextFeild: UITextField!
    @IBOutlet weak var numerDetailButton: UIButton!
        
//    private let banner: GADBannerView = {
//        let banner = GADBannerView()
//        banner.adUnitID = "ca-app-pub-7017707106779821/8635963911" // real id
////        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716" //test id
//        banner.backgroundColor = .secondarySystemBackground
//        return banner
//    }()
    
    var indianValueMap:[String:Int] = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 8, "g": 3, "h": 5, "i": 1, "j": 1, "k": 2, "l": 3, "m": 4, "n": 5, "o": 7, "p": 8, "q": 1, "r": 2, "s": 3, "t": 4, "u": 6, "v": 6, "w": 6, "x": 5, "y": 1, "z": 7]

    
    var indianValueMap2:[String:Int] = ["a": 1, "b": 2, "c": 2, "d": 4, "e": 5, "f": 8, "g": 3, "h": 8, "i": 1, "j": 1, "k": 2, "l": 3, "m": 4, "n": 5, "o": 7, "p": 8, "q": 1, "r": 2, "s": 3, "t": 4, "u": 6, "v": 6, "w": 6, "x": 6, "y": 1, "z": 7]
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        banner.frame = CGRect(x: 0, y: view.frame.size.height-114, width: view.frame.width, height: 100).integral
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if #available(iOS 14, *) {
//            ATTrackingManager.requestTrackingAuthorization { status in
//                if status == .authorized {
//                    print("Access Allowed to display ads in a version above 14")
//                    self.banner.rootViewController = self
//                    self.view.addSubview(self.banner)
//                    self.banner.load(GADRequest())
//                    print(ASIdentifierManager.shared().advertisingIdentifier.uuidString, " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
//
//                }else if status == .denied{
//                    print("AD STATUS WAS DENIED  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
//                    self.banner.rootViewController = self
//                    self.view.addSubview(self.banner)
//                    self.banner.load(GADRequest())
//                    print(ASIdentifierManager.shared().advertisingIdentifier.uuidString, " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
//                }else{
//                    self.banner.rootViewController = self
//                    self.view.addSubview(self.banner)
//                    self.banner.load(GADRequest())
//                    print(ASIdentifierManager.shared().advertisingIdentifier.uuidString, " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
//                }
//            }
//        }else{
//            print("not 14 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
//        }
//
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        self.wordInputTextFeild.delegate = self
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red: 0.29, green: 0.42, blue: 0.72, alpha: 1.00).cgColor, UIColor(red: 0.09, green: 0.16, blue: 0.28, alpha: 1.00).cgColor]
        
        wordInputTextFeild.attributedPlaceholder = NSAttributedString(
            string: "Enter Name or dd/mm/yyyy here",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        calculateNumericalValue()
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func calculateNumericalValue(_ sender: Any? = nil) {
        
        if(String(wordInputTextFeild.text ?? "").contains("/") && String(wordInputTextFeild.text ?? "").count == 10){
            let word: String = wordInputTextFeild.text ?? ""
            var total = 0
            for char in word{
                if char >= "0" && char <= "9"{
                    total += Int(String(char)) ?? 0
                }
            }
            if total != 0{
                numberTotalLabel.text = String(total)
                singleDigitSum(received: total)
            
                numerDetailButton.isHidden = false
            }
            
        }
        else if((String(wordInputTextFeild.text ?? "").contains("/") && String(wordInputTextFeild.text ?? "").count > 10) || (String(wordInputTextFeild.text ?? "").contains("/") && String(wordInputTextFeild.text ?? "").count < 10)){
            let alert = UIAlertController(title: "Error", message: "Please enter a valid date in the form of dd/mm/yyyy", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: becomeRespond)
            
            numerDetailButton.isHidden = true
            
        }else if(wordInputTextFeild.text != ""){
            let word: String = wordInputTextFeild.text ?? ""
            let lowerCasedWord = word.lowercased()
            var total = 0
            for char in lowerCasedWord{
                if char != " "{
                    total += indianValueMap[String(char)] ?? 0
                }
            }
            if total != 0{
            numberTotalLabel.text = String(total)
            singleDigitSum(received: total)
            
            numerDetailButton.isHidden = false
            }else{
                let alert = UIAlertController(title: "Error", message: "Please do not enter only numbers", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: becomeRespond)
                
                numerDetailButton.isHidden = true
            }
            
        }else{
            let alert = UIAlertController(title: "Error", message: "Please enter a name in the field below", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: becomeRespond)
            numberTotalLabel.text = "--"
            numerologyTotalLabel.text = "-"
            
            numerDetailButton.isHidden = true;
        }
    }
    
    func becomeRespond(){
        wordInputTextFeild.becomeFirstResponder()
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
        let yourAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 14),
              .foregroundColor: UIColor.white,
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
        numerologyTotalLabel.text = "No." + String(sum)
        
        let attributeString = NSMutableAttributedString(
                string: "See what " + String(sum) + " means in numerology 👀 ➡️",
                attributes: yourAttributes
             )
        numerDetailButton.setAttributedTitle(attributeString, for: .normal)
        numeroSingleton.shared.numero = sum
    }
    
    
    
}
