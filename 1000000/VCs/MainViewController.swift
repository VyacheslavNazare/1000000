//
//  MainViewController.swift
//  1000000
//
//  Created by Вячеслав on 30.01.2022.
//

import UIKit

enum Difficulty {
    case random, serial
}

class MainViewController: UIViewController {

    @IBOutlet weak var difficultySelected: UISegmentedControl!
    @IBOutlet var newGameButton: UIButton!
    @IBOutlet var ResaultButton: UIButton!
    @IBOutlet var exitGameButton: UIButton!
    @IBOutlet var ResuktLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configButton()
        guard let record = Game.shared.records.last else {return}
        self.ResuktLabel.text = "Прошлый результат: \(record.score)"
    }
    
    private var selectDifficulty: Difficulty {
        switch difficultySelected.selectedSegmentIndex {
        case 0:
            return .serial
        case 1:
            return .random
        default:
            return .serial
        }
    }
    
    private func configButton() {
        newGameButton.layer.borderColor = UIColor.yellow.cgColor
        newGameButton.layer.borderWidth = 1
        ResaultButton.layer.borderColor = UIColor.yellow.cgColor
        ResaultButton.layer.borderWidth = 1
        exitGameButton.layer.borderColor = UIColor.yellow.cgColor
        exitGameButton.layer.borderWidth = 1
    }
    
    @IBAction func exitGameButton(_ sender: Any) {
        exit(0)
    }
}

