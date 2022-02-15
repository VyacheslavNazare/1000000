//
//  Strategy.swift
//  1000000
//
//  Created by Вячеслав on 10.02.2022.
//

import Foundation

protocol StrategyProtocol {
    func createQuestion(questionArray: [QuestionModel]) -> [QuestionModel]
}

final class RandomStrategy: StrategyProtocol {
    
    func createQuestion(questionArray: [QuestionModel]) -> [QuestionModel] {
        var array: [QuestionModel] = []
        let question = questionArray.randomElement()
        array.append(question!)
        return array
    }
}

final class Strategy: StrategyProtocol {
    
    func createQuestion(questionArray: [QuestionModel]) -> [QuestionModel] {
        return questionArray
    }
}
