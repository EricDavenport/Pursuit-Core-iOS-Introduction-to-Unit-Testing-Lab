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

  
  @IBOutlet var answerOptions: [UIButton]!
  
  
  var trivia: Trivia?
  
    override func viewDidLoad() {
        super.viewDidLoad()
      updateUI()
    }
    
  func updateUI() {
    questionLabel.text = trivia?.question.removingPercentEncoding
    
    
  }

}
