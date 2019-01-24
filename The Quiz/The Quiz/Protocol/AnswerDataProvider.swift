//
//  AnswerDataProvider.swift
//  The Quiz
//
//  Created by Calvin Cantin on 2019-01-21.
//  Copyright © 2019 Calvin Cantin. All rights reserved.
//

import Foundation

protocol AnswerDataProvider {
    var answer: String { get }
    var playerCorectlyAnswered: Bool { get }
}
