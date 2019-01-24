//
//  Comment.swift
//  The Quiz
//
//  Created by Calvin Cantin on 2019-01-22.
//  Copyright © 2019 Calvin Cantin. All rights reserved.
//

import Foundation

enum Comment
{
    case belowAverage
    case average
    case aboveAverage
    case genius
    
    var translation: String
    {
        switch self {
        case .belowAverage:
            return "En dessous de la moyenne"
        case .average:
            return "Dans la moyenne"
        case .aboveAverage:
            return "Au dessu de la moyenne"
        case .genius:
            return "Génie"
        }
    }
}


