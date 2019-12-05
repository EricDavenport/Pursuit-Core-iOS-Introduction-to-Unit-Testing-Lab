//
//  TriviaViewController.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/2/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var trivia = [[Trivia]]() {
    didSet {
      tableView.reloadData()
    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      loadData()
      tableView.dataSource = self
      dump(trivia)

    }
  func loadData() {
    //let triviaList = TriviaData.getTrivia()
    trivia = TriviaData.getSections()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let triviaDetailVC = segue.destination as? TriviaDetailVC,
      let indexPath = tableView.indexPathForSelectedRow else {
        fatalError("Unable to deque cell")
    }
    triviaDetailVC.trivia = trivia[indexPath.section][indexPath.row]
    
  }
    

    
}

extension TriviaViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
    let myTrivia = trivia[indexPath.section][indexPath.row]
    
    cell.textLabel?.text = myTrivia.question.removingPercentEncoding
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return trivia[section].count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return trivia.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return trivia[section].first?.difficulty.uppercased()
  }
  
}
