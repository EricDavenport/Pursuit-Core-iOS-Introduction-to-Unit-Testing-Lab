//
//  StarWarsDetailVC.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/5/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

class StarWarsDetailVC: UIViewController {
  
  var currentFilm: Films?

  @IBOutlet weak var textView: UITextView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      updateUI()

    }
  
  func updateUI() {
    textView.text = currentFilm?.opening_crawl
    navigationItem.title = currentFilm?.title
  }
  


}
