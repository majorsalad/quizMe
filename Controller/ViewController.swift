//
//  ViewController.swift
//  QuizMe-iOS13
//
//  Controller should only be responsible for telling the other components (View and Model) what to do
//  It should handle user interaction from the view and respond accordingly and be able to fetch data from our model.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    var answerStatus : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
            let userAnswer = sender.currentTitle! //True or False
            answerStatus = quizBrain.checkAnswer(userAnswer) //since checkAnswer func has an underscore in front of parameter, parameter name "userAnswer" does not have to be specified. Instead you can just pass the parameter without an external parameter name
        
            if(answerStatus){
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
            
            quizBrain.nextQuestion()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Change `0.5` to the desired number of seconds.
                   // Code you want to be delayed
                    self.updateUI()
                }
            
        
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore(answerStatus))"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

