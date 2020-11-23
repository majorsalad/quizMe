//
//  QuizBrain.swift
//  QuizMe-iOS13
//
//  Created by Faisal Salad on 11/21/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//
// The Model handles everything related to the data and our quiz questions

import Foundation

struct QuizBrain{
    
    let quiz = [
        Question(q: "Swift is a programming language", a: "True"),
        Question(q: "An optional cannot hold a nil value", a: "False"),
        Question(q: "The storyboard is where the coding is performed in Xcode", a: "False"),
        Question(q: "A struct is similar to a class in other programming languages", a: "True"),
        Question(q: "A function thats written inside of a struct is known as an instruction", a: "False"),
        Question(q: "An Outlet is what we use to connect our storyboard to our view controller", a: "True"),
        Question(q: "sender.titleText is the way we retrieve the text for a button", a: "False"),
        Question(q: "viewDidLoad() runs at the end, once the app finishes running all the code", a: "False"),
        Question(q: "Every line in Swift needs to end in a semicolon", a: "False")
    ]
    
    var questionNumber = 0
    var score = 0
    
    
    //This method validates the incoming userAnswer. If it matches the correct answer true will be returned.
    func checkAnswer(_ userAnswer : String) -> Bool /* "-> Bool" sets the return type to boolean*/ {
        if(userAnswer == quiz[questionNumber].answer){
            return true
        } else {
            return false
        }
    }
    
    mutating func getScore(_ answerStatus : Bool) -> Int {
        if(questionNumber == 0){
            score = 0
            return score
        }
        
        if(answerStatus){
            score+=1
            return score
        } else {
            return score
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float (quiz.count)
    }
    
    mutating func nextQuestion() { /*
         a struct has 2 types of methods:
         - those that change the state of the structure (mutating)
         - those that don't (normal methods)
         
         So, we need to label a method that changes a property from WITHIN the struct with "mutating," otherwise we will
         see an error
         */
        if(questionNumber + 1 < quiz.count){
            questionNumber+=1
        } else {
            questionNumber = 0
        }
    }
    
}
