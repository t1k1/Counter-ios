//
//  ViewController.swift
//  Counter-ios
//
//  Created by Aleksey Kolesnikov on 17.04.2023.
//

import UIKit

class ViewController: UIViewController {

    //Лейбл
    @IBOutlet weak var counterLabel: UILabel!
    
    //Кнопки
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    //Text view
    @IBOutlet weak var historyView: UITextView!
    
    //Счетчик
    private var count: Int = 0

    //Перечисление действий кнопок
    private enum Actions {
        case increase
        case decrese
        case decreseZero
        case reset
    }
    
    private var action: Actions = .reset
    
    //функция возвращает текущую дату в красивом формате
    private func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.MM.yyyy HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
    
    //Функция обновляет text view в зависмости от действия
    private func updateTextView(buttonAction: Actions) {
        let date = getCurrentDate()
        
        switch buttonAction {
            case .decrese:
                historyView.text += "\n[\(date)]: значение изменено на -1"
            case .decreseZero:
                historyView.text += "\n[\(date)]: попытка уменьшить значение счётчика ниже 0"
            case .increase:
                historyView.text += "\n[\(date)]: значение изменено на +1"
            case .reset:
                historyView.text += "\n[\(date)]: значение сброшено"
        }
    }
    
    //Функция обновляет счетчик
    private func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: " + String(count)
    }
    
    @IBAction func increseByOne() {
        count += 1
        action = .increase
        
        updateCounterLabel()
        updateTextView(buttonAction: action)
    }
    
    @IBAction func decreaseByOne() {
        if count > 0 {
            count -= 1
            action = .decrese
            
            updateCounterLabel()
        } else {
            action = .decreseZero
        }
        updateTextView(buttonAction: action)
    }
    
    @IBAction func resetCounter() {
        count = 0
        action = .reset
        
        updateCounterLabel()
        updateTextView(buttonAction: action)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCounterLabel()
    }

}

