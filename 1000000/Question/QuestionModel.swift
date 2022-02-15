//
//  QuestionModel.swift
//  1000000
//
//  Created by Вячеслав on 02.02.2022.
//

import Foundation

struct QuestionModel {
    let question: String
    let correctAnswer: String
    let answers: [String]
    
    init(question: String, correctAnswer: String, answer: [String]) {
        self.question = question
        self.correctAnswer = correctAnswer
        self.answers = answer
    }
}

struct QuestionBase {
    static func data() -> [QuestionModel] {
        let data = [
            QuestionModel(question: "В каком году отменили крепостное право на Руси по григорианскому календарю?", correctAnswer: "3 марта 1861г", answer: ["1 февраля 1903г", "3 марта 1861г", "14 июня 1899г", "Находится на рассмотрении"]),
            QuestionModel(question: "Кто написал книги о Гарри Поттере?", correctAnswer: "Джоан Роулинг", answer: ["Джоан Роулинг", "Марк Твен", "Эрнест Хемингуэй", "А.С. Пушкин"]),
            QuestionModel(question: "Что такое синнабон?", correctAnswer: "Булочка с коррицей", answer: ["Сорт томата", "Итальянская запеканка", "Булочка с коррицей", "Храм в южной Азии"]),
            QuestionModel(question: "Как в химии обозначается золото?", correctAnswer: "Au", answer: ["Zl", "Gd", "Gl", "Au"]),
            QuestionModel(question: "Сколько всего было царей в России?", correctAnswer: "17", answer: ["7", "17", "14", "12"])
        ]
        return data
    }
}

