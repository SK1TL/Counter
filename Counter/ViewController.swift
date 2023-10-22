import UIKit

class ViewController: UIViewController {
    
    private var count = 0
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    }
    
    private func dateString() -> String {
        dateFormatter.string(from: Date())
    }

    @IBAction private func increaseButtonTapped(_ sender: Any) {
        count += 1
        counterLabel.text = "Значение счётчика: \(count)"
        historyTextView.text += "\n \(dateString()): значение изменено на +1"
    }
    
    @IBAction private func decreaseButtonTapped(_ sender: Any) {
        if count > 0 {
            count -= 1
            counterLabel.text = "Значение счётчика: \(count)"
            historyTextView.text += "\n \(dateString()): значение изменено на -1"
        } else {
            historyTextView.text += "\n \(dateString()): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction private func resetButtonTapped(_ sender: Any) {
        count = 0
        counterLabel.text = "Значение счётчика: \(count)"
        historyTextView.text += "\n \(dateString()): значение сброшено"
    }
}
