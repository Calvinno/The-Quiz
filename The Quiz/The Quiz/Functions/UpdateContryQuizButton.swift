//
//  Function.swift
//  Quiz QUIZ!
//
//  Created by Calvin Cantin on 2018-11-26.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit

// It was a test to see if I can put function in other file
func updateContryQuizButton(contry:ContryImage,buttons:[UIButton])
{
    var answerPossibilitys = contry.answerPossibility
    
    for button in buttons
    {
        let number = Int.random(in: 0...answerPossibilitys.count - 1)
        button.setTitle(answerPossibilitys.remove(at: number), for: .normal)
    }
    
}
