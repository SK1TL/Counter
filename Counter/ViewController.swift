import UIKit

class ViewController: UIViewController {
    private var count = 0

    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    }
    
    private func dateString() -> String {
        var todayDate = Date()
        return dateFormatter.string(from: todayDate)
    }

    @IBAction private func increaseOne(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счётчика: \(count)"
        historyTextView.text += "\n \(dateString()): значение изменено на +1"
    }
    
    @IBAction private func decreaseOne(_ sender: Any) {
        if count > 0 {
            count -= 1
            counterLabel.text = "Значение счётчика: \(count)"
            historyTextView.text += "\n \(dateString()): значение изменено на -1"
        } else {
            historyTextView.text += "\n \(dateString()): попытка уменьшить значение счётчика ниже 0"
        }
        
    }
    
    @IBAction private func resetAll(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счётчика: \(count)"
        historyTextView.text += "\n \(dateString()): значение сброшено"
    }
}

