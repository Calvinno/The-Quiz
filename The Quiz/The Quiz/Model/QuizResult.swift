//
//  QuizResult.swift
//  Quiz QUIZ!
//
//  Created by Calvin Cantin on 2018-11-22.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import Foundation

class QuizResult: Codable
{
    var quizType:String
    var result:String
    static var documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static var archiveURL = QuizResult.documentDirectory.appendingPathComponent("QuizResult").appendingPathExtension("plist")
    init(quizType:String,result:String)
    {
        self.quizType = quizType
        self.result = result
    }
    
    static func saveToFile(quizResults:[QuizResult])
    {
        let quizResultEncoder = PropertyListEncoder()
        let encodedQuizResult = try? quizResultEncoder.encode(quizResults)
        try? encodedQuizResult?.write(to: archiveURL)
    }
    static func loadFromFile() -> [QuizResult]?
    {
        let quizResultDecoder = PropertyListDecoder()
        
        if let retrivedQuizResults = try? Data(contentsOf: archiveURL)
        {
            if let decodedQuizResults = try? quizResultDecoder.decode(Array<QuizResult>.self, from: retrivedQuizResults)
            {
                return decodedQuizResults
            }
        }
        return nil
    }
}
