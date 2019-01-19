//
//  IntroductionViewController.swift
//  Quiz QUIZ!
//
//  Created by Calvin Cantin on 2018-10-26.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController{
    var delegate: SavesResultsTableViewControllerDelegate?
    
    @IBOutlet weak var matematicQuizButton: UIButton!
    @IBOutlet weak var montryQuizButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.setResult(result: nil)
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {

        if segue.identifier == "ContryQuizSegue"
        {
            let navigationController = segue.destination as! UINavigationController
            let quizViewController = navigationController.topViewController as! QuizViewController
            quizViewController.matematicalQuizIsHidden = true
        }
        
        
    }
    @IBAction func unwindResultToMenue(unwindSegue: UIStoryboardSegue)
    {
    }
    @IBAction func unwindSavedResultToMenue(unwindSegue: UIStoryboardSegue)
    {
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
