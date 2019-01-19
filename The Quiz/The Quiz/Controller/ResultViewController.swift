//
//  ResultViewController.swift
//  Quiz QUIZ!
//
//  Created by Calvin Cantin on 2018-10-26.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit

protocol SavesResultsTableViewControllerDelegate
{
    func setResult(result: QuizResult?)
}

class ResultViewController: UIViewController {
    
    var delegate: SavesResultsTableViewControllerDelegate?
    var matematicalAnswers:[MatematicalExpression]?
    var contryAnswers:[Image_Contry]?
    var goodAnswersNumber:Double
    {
        //Calcaulating the number of good answer
        var goodAnswers = 0
        if let answers = matematicalAnswers
        {
            for answer in answers
            {
                if answer.playerCorectlyAnswered == true
                {
                    goodAnswers += 1
                }
            }
        }
        if let answers = contryAnswers
        {
            for answer in answers
            {
                if answer.playerCorectlyAnswered == true
                {
                    goodAnswers += 1
                }
            }
        }
        return Double(goodAnswers)
    }
    var result:String
    {
        var results = ""
        if let answers = matematicalAnswers
        {
            //Calculating the answer pourcentage
            let goodAnswerPourcentage = goodAnswersNumber/Double(answers.count)
            if goodAnswerPourcentage < 0.25
            {
                results = "Stupide"
            }
            else if goodAnswerPourcentage >= 0.25 && goodAnswerPourcentage < 0.5
            {
                results = "Dans la moyenne"
            }
            else if goodAnswerPourcentage >= 0.50 && goodAnswerPourcentage < 0.75
            {
                results = "Dans la moyenne"
            }
            else if goodAnswerPourcentage >= 0.75 && goodAnswerPourcentage < 1
            {
                results = "Au dessu de la moyenne"
            }
            else if goodAnswerPourcentage == 1
            {
                results = "Génie"
            }
            
        }
        else if let answer = contryAnswers
        {
            let goodAnswerPourcentage = goodAnswersNumber/Double(answer.count)
            if goodAnswerPourcentage < 0.25
            {
                results = "Stupide"
            }
            else if goodAnswerPourcentage >= 0.25 && goodAnswerPourcentage < 0.5
            {
                results = "Dans la moyenne"
            }
            else if goodAnswerPourcentage >= 0.50 && goodAnswerPourcentage < 1
            {
                results = "Au dessu de la moyenne"
            }
            else if goodAnswerPourcentage == 1
            {
                results = "Génie"
            }
            
        }
        
        return results
    }
    var resultText:String
    {
        var resultText = ""
        // define the result
        switch result
        {
        case "Stupide":
            resultText = "Vous avez peut être besoin de reviser vos mathématique ou d'appronfondir vos connaissance générale"
        case "Dans la moyenne":
            resultText = "Vous n'ête pas spécialement intelligent mais pas si idiot."
        case "Au dessu de la moyenne":
            resultText = "Vous êtes supérieur à la moyenne"
        case "Génie":
            resultText = "Vous mériter de controller le monde tellement vos faculté intelectuelle sont élevé"
        default:
            resultText = "Il y a eu une erreur"
        }
        return resultText
    }
    var quizResult:QuizResult
    {
        var type = ""
        if matematicalAnswers != nil
        {
            type = "Matematical Quiz"
        }
        if contryAnswers != nil
        {
            type = "Contry Quiz"
        }
        return QuizResult(quizType:type, result: result)
    }
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionTextView: UITextView!
    @IBOutlet weak var resultTableView: UITableView!
    
    var tableViewDataSource = ResultTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDataSource.matematicalResults = matematicalAnswers
        tableViewDataSource.contryResults = contryAnswers
        self.resultLabel.text = result
        self.resultDescriptionTextView.text = resultText
        self.resultTableView.dataSource = tableViewDataSource
        delegate?.setResult(result: quizResult)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} 
