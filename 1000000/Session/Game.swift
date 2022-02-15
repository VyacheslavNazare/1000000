//
//  GameSingleton.swift
//  1000000
//
//  Created by Вячеслав on 10.02.2022.
//

import Foundation

class Game {
    
    static let shared = Game()
    private let recordsMemento = Records()
    
    
    
    private(set) var records: [GameSession] {
        didSet {
            recordsMemento.save(records: self.records)
        }
    }
    
    private init() {
        self.records = self.recordsMemento.loadRecords()
    }
    
    func addRecord(record: GameSession) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
    
}
