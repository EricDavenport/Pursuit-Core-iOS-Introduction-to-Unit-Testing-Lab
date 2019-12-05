//
//  JokesDetailVC.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/4/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

class JokesDetailVC: UIViewController {
  
  @IBOutlet weak var setUpLabel: UILabel!
  
  @IBOutlet weak var punchlineLabel: UILabel!
  
  var joke: Joke?

    override func viewDidLoad() {
        super.viewDidLoad()
      
      updateUI()
    }
  
  func updateUI() {
    punchlineLabel.text = joke?.punchline
    setUpLabel.text = joke?.setup
  }
    

}
