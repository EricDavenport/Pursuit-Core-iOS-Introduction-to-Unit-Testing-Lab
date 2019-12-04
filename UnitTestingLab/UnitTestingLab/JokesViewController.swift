//
//  JokesViewController.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/2/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {

  @IBOutlet weak var tableview: UITableView!
  
  var jokes = [Joke]() {
    didSet {
      tableview.reloadData()
    }
  }
  func loadData() {
    jokes = Joke.getJokes()
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      tableview.dataSource = self
      loadData()
    }
    

}

extension JokesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "jokesCell", for: indexPath)
    
    let joke = jokes[indexPath.row]
    
    cell.textLabel?.text = joke.setup
    cell.detailTextLabel?.text = "Joke ID: \(joke.id.description)"
    
    
    return cell
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return jokes.count

  }
  }
