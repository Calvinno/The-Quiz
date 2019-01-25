//
//  WrongAnswerAnimation.swift
//  The Quiz
//
//  Created by Calvin Cantin on 2019-01-25.
//  Copyright © 2019 Calvin Cantin. All rights reserved.
//

import Foundation
import UIKit

func contryWrongAnswerAnimation(image:UIImageView)
{
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.07
    animation.repeatCount = 4
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: image.center.x - 10, y: image.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: image.center.x + 10, y: image.center.y))
    
    image.layer.add(animation, forKey: "position")
}

func mathematicalExpressionWrongAnswerAnimation(label: UILabel)
{
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 0.07
    animation.repeatCount = 4
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: label.center.x - 10, y: label.center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: label.center.x + 10, y: label.center.y))
    
    label.layer.add(animation, forKey: "position")
}
