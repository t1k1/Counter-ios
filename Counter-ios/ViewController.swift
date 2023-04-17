//
//  ViewController.swift
//  Counter-ios
//
//  Created by Aleksey Kolesnikov on 17.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    
    var count: Int = 0
    
    func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: " + String(count)
    }
    
    @IBAction func increseByOne() {
        count += 1
        updateCounterLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCounterLabel()
    }

}

