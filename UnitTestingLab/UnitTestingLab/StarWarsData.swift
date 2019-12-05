//
//  StarWarsData.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/3/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import Foundation

struct StarWarsFilms: Decodable {
  let results: [Films]

}

struct Films: Decodable {
  let title: String
  let episode_id: Int
  let opening_crawl: String
  let director: String
  let producer: String
  let release_date: String
  
}

enum CodingKeys: String, CodingKey {
  case openingCrawl = "opening_crawl"
  case releaseDate = "release_date"
  case episodeID = "episode_id"
}

extension StarWarsFilms {
  static func getData() -> [Films] {
    var film = [Films]()
    
    guard let fileURL = Bundle.main.url(forResource: "starWarsFilms", withExtension: "json") else {
      fatalError("failed to parse json")
    }
    
    do {
      
      let data = try Data(contentsOf: fileURL)
      
      let starWarsFilmData = try JSONDecoder().decode(StarWarsFilms.self, from: data)
      film = starWarsFilmData.results
    } catch {
      fatalError("failed to decode error: \(error)")
    }
    return film
  }
}

