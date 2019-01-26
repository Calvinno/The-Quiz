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
    var answer: Answers?
    
    var result: String
    {
        return answer?.result ?? ""
    }
    var resultText:String
    {
        var resultText = ""
        // define the result
        switch result
        {
        case "En dessous de la moyenne":
            resultText = "Vous avez peut être besoin de reviser vos mathématique ou d'appronfondir vos connaissance générale"
        case "Dans la moyenne":
            resultText = "Vous n'avez pas plus de connaissance que la plus part des gens mais pas moin non plus."
        case "Au dessu de la moyenne":
            resultText = "Vous avez plus de connaissance que la majorité des gens. Félicitation"
        case "Génie":
            resultText = "Vous mériter de controller le monde tellement vos faculté intelectuelle sont élevé"
        default:
            resultText = "Il y a eu une erreur"
        }
        return resultText
    }
    var quizResult:QuizResult
    {
        return answer?.quizResult ?? QuizResult(quizType: "", result: result)
    }
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionTextView: UITextView!
    @IBOutlet weak var resultTableView: UITableView!
    
    var tableViewDataSource = ResultTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDataSource.matematicalResults = answer?.listOfMathematicalAnswers
        tableViewDataSource.contryResults = answer?.listOfContryAnswers
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
