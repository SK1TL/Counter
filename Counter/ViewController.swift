import UIKit

var todayDate = Date()
let dateFormatter = DateFormatter()
let dateInfo = dateFormatter.string(from: todayDate)

class ViewController: UIViewController {
    private var count = 0

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyText: UITextView!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        historyText.isEditable = false
        historyText.isScrollEnabled = true
    }

    @IBAction private func increaseOne(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счётчика: \(count)"
        historyText.text += "\n \(dateInfo): значение изменено на +1"
    }
    
    @IBAction private func decreaseOne(_ sender: Any) {
        if count > 0 {
            count -= 1
            counterLabel.text = "Значение счётчика: \(count)"
            historyText.text += "\n \(dateInfo): значение изменено на -1"
        } else {
            historyText.text += "\n \(dateInfo): попытка уменьшить значение счётчика ниже 0"
        }
        
    }
    
    @IBAction private func resetAll(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счётчика: \(count)"
        historyText.text += "\n \(dateInfo): значение сброшено"
    }
}

