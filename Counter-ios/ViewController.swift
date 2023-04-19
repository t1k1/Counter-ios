//
//  ViewController.swift
//  Counter-ios
//
//  Created by Aleksey Kolesnikov on 17.04.2023.
//

import UIKit

class ViewController: UIViewController {

    //Лейбл
    @IBOutlet private weak var counterLabel: UILabel!
    
    //Кнопки
    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    //Text view
    @IBOutlet private weak var historyView: UITextView!
    
    //Счетчик
    private var count: Int = 0

    //Форматирование даты
    private let dateFormatter = DateFormatter()
    
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
        dateFormatter.dateFormat = "d.MM.yyyy HH:mm:ss"
        
        return dateFormatter.string(from: Date())
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
    
    @IBAction private func increseByOne() {
        count += 1
        action = .increase
        
        updateCounterLabel()
        updateTextView(buttonAction: action)
    }
    
    @IBAction private func decreaseByOne() {
        if count > 0 {
            count -= 1
            action = .decrese
            
            updateCounterLabel()
        } else {
            action = .decreseZero
        }
        updateTextView(buttonAction: action)
    }
    
    @IBAction private func resetCounter() {
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

