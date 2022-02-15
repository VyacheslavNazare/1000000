//
//  GameSession.swift
//  1000000
//
//  Created by Вячеслав on 02.02.2022.
//

import Foundation

class GameSession: Codable {
    var date: Date
    var score: Int
    var percent: Int
    
    init(date: Date, score: Int, percent: Int) {
        self.date = date
        self.score = score
        self.percent = percent
    }
}
