//
//  ViewController.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/2/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var starWarsMovies = [Films]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  func loadData() {
    starWarsMovies = StarWarsFilms.getData()
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      loadData()
      tableView.dataSource = self

  }


}

extension StarWarsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return starWarsMovies.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
    
    let film = starWarsMovies[indexPath.row]
    
    cell.textLabel?.text = film.title
    cell.detailTextLabel?.text = "\(film.episode_id)"
    
    return cell
  }
}
