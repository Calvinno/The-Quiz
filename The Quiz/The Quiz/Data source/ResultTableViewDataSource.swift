//
//  ResultTableViewDataSource.swift
//  Quiz QUIZ!
//
//  Created by Calvin Cantin on 2018-11-14.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit

class ResultTableViewDataSource: NSObject, UITableViewDataSource {
    
    var matematicalResults:[MatematicalExpression]?
    var contryResults:[Image_Contry]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var resultsCount = 0
        if let results = matematicalResults
        {
            resultsCount = results.count
        }
        else if let results = contryResults
        {
            resultsCount = results.count
        }
        return resultsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell") as! ResultTableViewCell
        
        if let results = matematicalResults
        {
            cell.contryQuizStackView.isHidden = true
            let matematicalExpression = results[indexPath.row]
            
            cell.matematicalExpressionTrueOrFalseAnswer.textColor = matematicalExpression.playerCorectlyAnswered == true ? UIColor.green:UIColor.red
    
            cell.updateMatematicalExpressionStackViewContent(matematicalExpression: matematicalExpression.expression , trueOrFalse: matematicalExpression.playerCorectlyAnswered == true ? "✔︎":"✖︎")
            
        }
        else if let results = contryResults
        {
            cell.matematicalStackView.isHidden = true
            let contry = results[indexPath.row]
            
            cell.contryTrueOrFalseAnswer.textColor = contry.playerCorectlyAnswered == true ? UIColor.green:UIColor.red
            
            cell.updateContryStackViewContent(image: contry.image, trueOrFalse: contry.playerCorectlyAnswered == true ? "✔︎":"✖︎")
            
        }
        return cell
    }
    
    
    
    
    
    // Do any additional setup after loading the view.
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
