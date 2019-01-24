//
//  Sequence.swift
//  The Quiz
//
//  Created by Calvin Cantin on 2019-01-21.
//  Copyright © 2019 Calvin Cantin. All rights reserved.
//

import Foundation

extension Sequence
{
    func count(where predicate: (Element) -> Bool) -> Int {
        return reduce(0) { currentResult, currentItem in
            return currentResult + (predicate(currentItem) ? 1 : 0)
        }
    }
}

extension Sequence where Element: AnswerDataProvider {
    var countOfCorrectAnswers: Int {
        return count { $0.playerCorectlyAnswered }
    }
}
