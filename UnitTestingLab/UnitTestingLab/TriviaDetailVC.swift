//
//  TriviaDetailVC.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/5/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

class TriviaDetailVC: UIViewController {
  
  @IBOutlet weak var questionLabel: UILabel!

  
  @IBOutlet weak var button0: UIButton!
  @IBOutlet weak var button1: UIButton!
  @IBOutlet weak var button2: UIButton!
  @IBOutlet weak var button3: UIButton!
  
  
  
  var trivia: Trivia?
  
  var incorrectAnswers = [String]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      updateUI()
    }
    
  func updateUI() {
    questionLabel.text = trivia?.question.removingPercentEncoding
    incorrectAnswers = trivia!.incorrect_answers
    button0.titleLabel?.text = incorrectAnswers[0]
    button1.titleLabel?.text = trivia?.correct_answer
    button2.titleLabel?.text = incorrectAnswers[1]
    button3.titleLabel?.text = incorrectAnswers[2]

 
  }

}
