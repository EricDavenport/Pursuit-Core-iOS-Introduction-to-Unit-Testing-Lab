//
//  StarWarsData.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/3/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import Foundation

struct StarWarsFilms: Codable {
  let results: [Films]

}

struct Films: Codable {
  let title: String
  let episode_id: Int
  let opening_crawl: String
  let director: String
  let producer: String
  let release_date: String
  
}

extension StarWarsFilms {
  static func getData(from data: Data) -> [Films] {
    var film = [Films]()
    
    do {
      let starWarsFilmData = try JSONDecoder().decode(StarWarsFilms.self, from: data)
      film = starWarsFilmData.results
    } catch {
      fatalError("failed to decode error: \(error)")
    }
    return film
  }
}

