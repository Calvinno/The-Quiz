//
//  ContryTableViewCell.swift
//  Quiz QUIZ!
//
//  Created by Calvin Cantin on 2018-11-14.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell
{
    @IBOutlet weak var contryQuizStackView: UIStackView!
    @IBOutlet weak var contryImage: UIImageView!
    @IBOutlet weak var contryTrueOrFalseAnswer: UILabel!
    
    
    @IBOutlet weak var matematicalStackView: UIStackView!
    @IBOutlet weak var matematicalExpressionLabel: UILabel!
    @IBOutlet weak var matematicalExpressionTrueOrFalseAnswer: UILabel!
    
    
    func updateContryStackViewContent(image:UIImage, trueOrFalse:String)
    {
        contryImage.image = image
        contryTrueOrFalseAnswer.text = trueOrFalse
    }
    func updateMatematicalExpressionStackViewContent(matematicalExpression: String, trueOrFalse: String)
    {
        matematicalExpressionLabel.text = matematicalExpression
        matematicalExpressionTrueOrFalseAnswer.text = trueOrFalse
        
    }
}


