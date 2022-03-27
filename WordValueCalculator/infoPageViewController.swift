//
//  infoPageViewController.swift
//  WordValueCalculator
//
//  Created by Yash Rraj Sood on 21/3/22.
//

import UIKit

class infoPageViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func icons8Button(_ sender: Any) {
        let tempUrl = NSURL(string:"https://icons8.com")! as URL
        UIApplication.shared.open(tempUrl, options: [:], completionHandler: nil)

    }
}
