//
//  DifficultyFacade.swift
//  1000000
//
//  Created by Вячеслав on 10.02.2022.
//

import Foundation

final class DifficultyFacade {
    
    let difficulty: Difficulty
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }
    
    fileprivate var array: [QuestionModel] = []
    
    private var createStrategy: StrategyProtocol {
        switch difficulty {
        case .random:
            return RandomStrategy()
        case .serial:
            return Strategy()
        }
    }
    
    func getArray(questionArray: [QuestionModel]) {
        array = createStrategy.createQuestion(questionArray: questionArray)
    }
    
    func setGame() -> [QuestionModel] {
        return array
    }
}
