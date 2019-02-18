//
//  QuizItem.swift
//  ItQuiz
//
//  Created by Strawberry jam on 2019/01/31.
//  Copyright © 2019 Strawberry jam. All rights reserved.
//

import Foundation

class QuizItem{
    let quizText:String
    let choices:[String]
    let answerNum:Int
    init(quizText:String,choices:[String],answerNum:Int){
        self.quizText = quizText
        self.choices = choices
        self.answerNum = answerNum
    }
}
