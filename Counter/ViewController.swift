//
//  ViewController.swift
//  Counter
//
//  Created by Sergei Biryukov on 07.04.2025.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
    var textField = ""
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var fieldDescription: UITextView!
    
    private func getCurrentDateTime() -> String {
        let format = DateFormatter()
        format.dateFormat = "[yyyy-MM-dd : HH:mm:ss]"
        return format.string(from: Date())
    }
    
    @IBAction func countIncrease(_ sender: Any) {
        counter += 1
        updateCount()
        textField += "\(getCurrentDateTime()): Значение изменено на +1\n"
        updateDescription()
    }
    
    
    @IBAction func countDecrease(_ sender: Any) {
        if counter != 0 {
            counter -= 1
            updateCount()
            textField += "\(getCurrentDateTime()): Значение изменено на -1\n"
            updateDescription()
        } else if counter == 0 {
            textField += "\(getCurrentDateTime()): Попытка уменьшить значение счётчика ниже 0\n"
            updateDescription()
        }
    }
    
    @IBAction func countRefresh(_ sender: Any) {
        counter = 0
        updateCount()
        textField += "\(getCurrentDateTime()): Значение сброшено\n"
        updateDescription()
    }
    
    
    private func updateCount() {
        countLabel.text = "\(counter)"
    }
    
    private func updateDescription() {
        fieldDescription.text = "\(textField)"
        let range = NSRange(location: fieldDescription.text.count - 1, length: 1)
        fieldDescription.scrollRangeToVisible(range)
    }
    
    private func configureDescriptionField() {
        fieldDescription.isScrollEnabled = true
        fieldDescription.isEditable = false
        fieldDescription.alwaysBounceVertical = true
        fieldDescription.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

