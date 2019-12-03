//
//  officialJokeData.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/2/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import Foundation

struct Joke: Decodable {
  let id: Int
  let type: String
  let setup: String
  let punchline: String
}

extension Joke {
  static func getJokes(from data: Data) -> [Joke] {
    var jokes = [Joke]()
    
    do {
      let officialJokesData = try JSONDecoder().decode([Joke].self, from: data)
      jokes = officialJokesData
    } catch {
      fatalError("decoding error: \(error)")
    }
    
    return jokes
  }
  
  
}
