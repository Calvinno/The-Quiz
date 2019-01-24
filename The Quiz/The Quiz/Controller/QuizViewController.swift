//
//  QuizViewController.swift
//  Quiz QUIZ!
//
//  Created by Calvin Cantin on 2018-10-26.
//  Copyright © 2018 Calvin Cantin. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController,UITextFieldDelegate {
    
    var mathematicalExpressionAnswers = [MatematicalExpression]()
    var contryQuizAnswers = [ContryImage]()
    var matematicalExpressionsNumber = 0
    var contrysNumber = 0
    var questionIndex = 1
    var timer = Timer()
    var time:Int = 0
    var mathematicalExpression:MatematicalExpression?
    var contry:ContryImage?
    var keyboardHeight: CGFloat = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var matematicalQuizStackview: UIStackView!
    @IBOutlet weak var contryQuizStackView: UIStackView!
    
    
    @IBOutlet weak var matematicalExpressionTimerLabel: UILabel!
    @IBOutlet weak var matematicalExpresionLabel: UILabel!
    @IBOutlet weak var mathematicalExpressionTextField: UITextField!
    @IBOutlet weak var matematicStackViewHeightConstraint: NSLayoutConstraint!
    
    var compressed:Bool = true
    
    @IBOutlet weak var contryQuizTimerLabel: UILabel!
    @IBOutlet weak var contryQuizImageView: UIImageView!
    @IBOutlet var contryQuizAnswerChoicesButtons: [UIButton]!
    
    var matematicalQuizIsHidden:Bool?
    var matematicalExpressions:[MatematicalExpression] = [MatematicalExpression(expression: "2 × 2", answer: "4", playerCorectlyAnswered: false),
                                                          MatematicalExpression(expression: "5 + 2 × 6", answer: "17", playerCorectlyAnswered: false),
                                                          MatematicalExpression(expression: "6 - 3 × 8 ÷ 4", answer: "0", playerCorectlyAnswered: false),
                                                          MatematicalExpression(expression: "4 + 6 × 3 - 8", answer: "14", playerCorectlyAnswered: false),
                                                          MatematicalExpression(expression: "3 × 5 - 36 ÷ 4 + 1", answer: "7", playerCorectlyAnswered: false),
                                                          MatematicalExpression(expression: "5 + 3 - 9 × 2", answer: "-10", playerCorectlyAnswered: false)]
    // See pixeEb for image
    var contrys:[ContryImage] = [ContryImage(image: #imageLiteral(resourceName: "Pyramide"), answer: "Égypte", answerPossibility:["Cuba","Inde","Brésil","Égypte"] ,playerCorectlyAnswered: false),
                                  ContryImage(image: #imageLiteral(resourceName: "Tour Eiffel"), answer: "France", answerPossibility: ["Angleterre","Russie","Allemagne","France"], playerCorectlyAnswered: false),
                                  ContryImage(image: #imageLiteral(resourceName: "Machu Picchu"),answer:"Perou", answerPossibility: [ "Chili","Chine","Asie","Perou"], playerCorectlyAnswered: false),
                                  ContryImage(image: #imageLiteral(resourceName: "Empire State Building"), answer: "Étas-Unis", answerPossibility: ["Mexique","Indonésie","Japon","Étas-Unis"], playerCorectlyAnswered: false),
                                  ContryImage(image: #imageLiteral(resourceName: "gaspesie-1373018_1920"), answer: "Canada", answerPossibility: ["Grèce","Australie","Haïti","Canada"], playerCorectlyAnswered: false),
                                  ContryImage(image: #imageLiteral(resourceName: "london-2393098_1920"), answer: "Angleterre", answerPossibility: ["Espagne","Italie","Corée du Sud","Angleterre"], playerCorectlyAnswered: false)]
    override func viewDidLoad() {
        super.viewDidLoad()
        mathematicalExpressionTextField.delegate = self
        self.matematicStackViewHeightConstraint.constant = self.view.frame.height - 150
        if let hidden = matematicalQuizIsHidden
        {
            contrysNumber = contrys.count
            startContryTimer()
            matematicalQuizStackview.isHidden = hidden
            updateContryQuizUI()
            
        }
        else
        {
            NotificationCenter.default.addObserver(self,selector: #selector(keyboardWillShow),name: UIResponder.keyboardWillShowNotification,object: nil)
            mathematicalExpressionTextField.becomeFirstResponder()
            moveStackView()
            matematicalExpressionsNumber = matematicalExpressions.count
            startMatematicalTimer()
            contryQuizStackView.isHidden = true
            updateMatematicalQuizUI()
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    func playerAnswerMathematicalExpression()
    {
        guard let answer = mathematicalExpressionTextField.text else {return}
        guard !answer.isEmpty else {return}
        
        mathematicalExpressionTextField.isEnabled = false
        
        if mathematicalExpressionTextField.text == mathematicalExpression?.answer
        {
            mathematicalExpressionTextField.textColor = UIColor.green
            mathematicalExpression?.playerCorectlyAnswered = true
            mathematicalExpressionAnswers.append(mathematicalExpression!)
            
            
        }
        else
        {
            mathematicalExpressionTextField.textColor = UIColor.red
            mathematicalExpression?.playerCorectlyAnswered = false
            mathematicalExpressionAnswers.append(mathematicalExpression!)
        }
        stopTimer()
        nextMatematicalExpression()
    }
    @IBAction func playerAnswedMatematicExpression(_ sender: UITextField) {
        playerAnswerMathematicalExpression()
    }
    
    
    //UI matematicalQuizModification
    func updateMatematicalQuizUI() -> Bool
    {
        guard matematicalExpressions.isEmpty == false else {return false}
        
        let number = Int.random(in: 0...matematicalExpressions.count - 1)
        mathematicalExpression = matematicalExpressions.remove(at: number)
        matematicalExpresionLabel.text = mathematicalExpression?.expression
        let totalProgress = Float(self.questionIndex)/Float(self.matematicalExpressionsNumber)
        self.progressBar.setProgress(totalProgress, animated: true)
        return true
    }
    
    func nextMatematicalExpression()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
        {
            
            self.questionIndex += 1
            self.matematicalExpressionTimerLabel.textColor = UIColor.black
            self.mathematicalExpressionTextField.textColor = UIColor.black
            self.mathematicalExpressionTextField.text = ""
            
            
            if self.updateMatematicalQuizUI()
            {
                self.matematicalExpressionTimerLabel.text = "10"
                self.startMatematicalTimer()
                self.mathematicalExpressionTextField.isEnabled = true
                self.mathematicalExpressionTextField.becomeFirstResponder()
            }
            else
            {
                self.mathematicalExpressionTextField.isEnabled = false
                
                self.performSegue(withIdentifier: "ResultSegue", sender: nil)
            }
        }
    }
    func startMatematicalTimer()
    {
        time = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateMatematicalTimer), userInfo: nil, repeats: true)
    }
    func stopTimer()
    {
        timer.invalidate()
    }
    
    @objc func updateMatematicalTimer()
    {
        time -= 1
        matematicalExpressionTimerLabel.text = String(time)
        if time <= 0
        {                                                                                                                                                                                                                                                                                                                                                                                   stopTimer()
            self.mathematicalExpression?.playerCorectlyAnswered = false
            self.mathematicalExpressionTextField.isEnabled = false
            matematicalExpressionTimerLabel.textColor = UIColor.red
            mathematicalExpressionAnswers.append(mathematicalExpression!)
            nextMatematicalExpression()
        }
    }
    //ContryUI function
    
    func startContryTimer()
    {
        time = 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateImageRepresentationTimer) , userInfo: nil, repeats: true)
    }
    @objc func updateImageRepresentationTimer()
    {
        time -= 1
        contryQuizTimerLabel.text = String(time)
        if time == 0
        {                                                                                                                                                                                                                                                                                                                                                                                   stopTimer()
            contry?.playerCorectlyAnswered = false
            for button in self.contryQuizAnswerChoicesButtons
            {
                button.isEnabled = false
            }
            contryQuizTimerLabel.textColor = UIColor.red
            contryQuizAnswers.append(contry!)
            nextContry()
        }
    }
    func updateContryQuizUI() -> Bool
    {
        guard !contrys.isEmpty else {return false}
        
        let number = Int.random(in: 0...contrys.count - 1)
        contry = contrys.remove(at: number)
        contryQuizImageView.image = contry?.image
        updateContryQuizButton(contry: contry!, buttons: contryQuizAnswerChoicesButtons)
        let totalProgress = Float(self.questionIndex)/Float(self.contrysNumber)
        self.progressBar.setProgress(totalProgress, animated: true)
        
        return true
    }
    
    func nextContry()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
        {
            self.questionIndex += 1
            self.contryQuizTimerLabel.textColor = UIColor.black
            for button in self.contryQuizAnswerChoicesButtons
            {
                button.titleLabel?.textColor = UIColor.black
            }
            
            for button in self.contryQuizAnswerChoicesButtons
            {
                button.isEnabled = true
                button.setTitleColor(.black, for: .normal)
            }
            
            if self.updateContryQuizUI()
            {
                self.contryQuizTimerLabel.text = "10"
                self.startContryTimer()
            }
            else
            {
                for button in self.contryQuizAnswerChoicesButtons
                {
                    button.isEnabled = false
                }
                self.questionIndex = 0
                self.performSegue(withIdentifier: "ResultSegue", sender:nil)
            }
        }
    }
    @IBAction func playerAnswerContryQuiz(_ sender: UIButton) {
        guard let answer = sender.titleLabel?.text else {return}
        
        for button in self.contryQuizAnswerChoicesButtons
        {
            button.isEnabled = false
            
        }
        if answer == contry?.answer
        {
            sender.setTitleColor(.green, for: .normal)
            contry?.playerCorectlyAnswered = true
            contryQuizAnswers.append(contry!)
        }
        else
        {
            sender.setTitleColor(.red, for: .normal)
            contry?.playerCorectlyAnswered = false
            contryQuizAnswers.append(contry!)
        }
        stopTimer()
        nextContry()
    }
    //keyboard and matematicalStackView func
    func moveStackView()
    {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3)
        {
                self.matematicStackViewHeightConstraint.constant = self.view.frame.height - (self.keyboardHeight + 100)
            self.view.layoutIfNeeded()
        }
    }
    @objc func keyboardWillShow(_ notification: Notification)
    {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
            moveStackView()
        }
    }
    
    
    
    //prepare for segue func
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultViewController = segue.destination as? ResultViewController
        if matematicalQuizStackview.isHidden == true
        {
            let answer = Answers.contry(contryQuizAnswers)
            resultViewController?.answer = answer
            
        }
        else
        {
            let answer = Answers.mathematical(mathematicalExpressionAnswers)
            resultViewController?.answer = answer
        }
        
        let resultVC = segue.destination as? ResultViewController
        let savedResultVC = storyboard?.instantiateViewController(withIdentifier: "SavedResultViewController") as? SavesResultsTableViewController
        
        resultVC?.delegate = savedResultVC
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
