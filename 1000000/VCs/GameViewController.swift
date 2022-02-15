//
//  GameViewController.swift
//  1000000
//
//  Created by Вячеслав on 30.01.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet var backButton: UIButton!
    
    @IBOutlet var progress: UIProgressView!
    @IBOutlet var question: UILabel!
    @IBOutlet var answerA: UIButton!
    @IBOutlet var answerB: UIButton!
    @IBOutlet var answerC: UIButton!
    @IBOutlet var answerD: UIButton!
    
    var questionsRandomArray: [QuestionModel] = []
    var questionArray: [QuestionModel] = QuestionBase.data()
    var strategy: StrategyProtocol!
    var facade: DifficultyFacade!
    var correctAnswerHandler: ((Int) -> Void)?
    var resultPersent = Observable<String>("0")
    var correctAnswer: Int = 0
    var persent: Int = 0
    var difficuty: Difficulty = .serial
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButton()
        facade = DifficultyFacade(difficulty: difficuty)
        facade.getArray(questionArray: questionArray)
        changeQuestion()
        self.progress.setProgress(0, animated: true)
        resultPersent.addObserver(persent as AnyObject, options: [.new, .initial]) { [weak self] (persent, _) in
//            guard let self = self else {return}
//            self.progress.progress = Float(Int(persent)! / 100)
        }
    }

    
    @IBAction func cheskAnswer(sender: UIButton) {
        guard let currentQuestion = questionArray.first(where: { qst -> Bool in
            return qst.question == question.text
        }) else {return}
        
        if sender.currentTitle == currentQuestion.correctAnswer{
            questionArray.removeAll { qst -> Bool in
                return qst.question == question.text
            }
            facade.getArray(questionArray: questionArray)
            self.correctAnswer += 1
            self.progress.progress += 0.2
            if correctAnswer == 5 {
                performSegue(withIdentifier: "winSegue", sender: self)
            }
            
            self.changeQuestion()
        } else {
            guard self.correctAnswer > 0 else {
                self.dismiss(animated: true, completion: nil)
                return
            }
            self.saveAndExit()
            
        }
    }

    
    private func changeQuestion() {
        persent = 100 * correctAnswer / 10
        resultPersent.value = "\(persent)"
        
        
        questionsRandomArray = facade.setGame()
        let qst = questionsRandomArray
        
        self.question.text = qst[0].question
        
        if !questionsRandomArray.isEmpty {
            let answers = qst[0].answers.shuffled()
            answerA.setTitle(answers[0], for: .normal)
            answerB.setTitle(answers[1], for: .normal)
            answerC.setTitle(answers[2], for: .normal)
            answerD.setTitle(answers[3], for: .normal)
        }
    }
    
    private func saveAndExit() {
        resultPersent.removeObserver(self)
        guard self.correctAnswer > 0 else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        let record = GameSession (date: Date(), score: correctAnswer, percent: persent)
        Game.shared.addRecord(record: record)
        self.correctAnswerHandler?(self.correctAnswer)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configButton() {
        backButton.layer.borderColor = UIColor.yellow.cgColor
        backButton.layer.borderWidth = 1
        answerA.layer.borderColor = UIColor.black.cgColor
        answerA.layer.borderWidth = 1
        answerA.layer.cornerRadius = 10
        answerB.layer.borderColor = UIColor.black.cgColor
        answerB.layer.borderWidth = 1
        answerB.layer.cornerRadius = 10
        answerC.layer.borderColor = UIColor.black.cgColor
        answerC.layer.borderWidth = 1
        answerC.layer.cornerRadius = 10
        answerD.layer.borderColor = UIColor.black.cgColor
        answerD.layer.borderWidth = 1
        answerD.layer.cornerRadius = 10
        question.layer.borderColor = UIColor.black.cgColor
        question.layer.cornerRadius = 10
        question.layer.borderWidth = 1
    }
}
