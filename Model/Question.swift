//
//  Question.swift
//  QuizMe-iOS13
//
//  Created by Faisal Salad on 11/18/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text : String
    let answer : String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
