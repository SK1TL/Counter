//
//  ViewController.swift
//  Counter
//
//  Created by Артур Гайфуллин on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    @IBOutlet weak var counterInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func countInfo() {
        count += 1
        counterInfo.text = "Значение счетчика: \(count)"
    }

    @IBAction func counterButton(_ sender: Any) {
        countInfo()
    }
}

