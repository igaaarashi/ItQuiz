//
//  QuizCategory.swift
//  ItQuiz
//
//  Created by Strawberry jam on 2019/01/31.
//  Copyright © 2019 Strawberry jam. All rights reserved.
//

import Foundation

class QuizCategory{
    var categoryName:String
    var quizList:[QuizItem];
    init(categoryName:String, quizList:QuizItem...){
        self.categoryName = categoryName
        self.quizList = quizList
    }
}
