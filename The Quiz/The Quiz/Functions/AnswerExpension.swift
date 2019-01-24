//
//  Answer.swift
//  The Quiz
//
//  Created by Calvin Cantin on 2019-01-22.
//  Copyright © 2019 Calvin Cantin. All rights reserved.
//

import Foundation

extension Answers
{
    var countOfAllAnswer: Int
    {
        switch self
        {
        case .contry(let contrys):
            return contrys.count
        case .mathematical(let mathematicalExpression):
            return mathematicalExpression.count
        }
    }
    
    var countOfCorrectAnswer: Int
    {
        switch self {
        case .mathematical(let mathematicalExpression):
            return mathematicalExpression.countOfCorrectAnswers
        case .contry (let contrys):
            return contrys.countOfCorrectAnswers
        }
    }
    var goodAnswerPercentage: Double {
        return Double(countOfCorrectAnswer)/Double(countOfAllAnswer)
    }
    
    var percentageWithComment: [(Double, Comment)]
    {
        switch self {
        case .mathematical:
            return [
                (0.0, .belowAverage),
                (0.25, .average),
                (0.5, .average),
                (0.75, .aboveAverage),
                (1.0, .genius)
            ]
        case .contry:
            return [
                (0.0, .belowAverage),
                (0.25, .belowAverage),
                (0.5, .aboveAverage),
                (1.0, .genius)
            ]
        }
    }
    var result: String {
        let goodAnswerPercentageValue = goodAnswerPercentage
        return percentageWithComment.reversed().first {
            return goodAnswerPercentageValue >= $0.0
            }?.1.translation ?? ""
    }
    
    var quizResult: QuizResult {
        let type: String
        switch self {
        case .mathematical:
            type = "Matematical Quiz"
        case .contry:
            type = "Contry Quiz"
        }
        return QuizResult(quizType: type, result: result)
    }
    var listOfMathematicalAnswers: [MatematicalExpression]?
    {
        switch self {
        case .mathematical(let mathematicalExpression):
            return mathematicalExpression
        default:
            return nil
        }
    }
    var listOfContryAnswers: [ContryImage]?
    {
        switch self {
        case .contry(let contrys):
            return contrys
        default:
            return nil
        }
    }
}


