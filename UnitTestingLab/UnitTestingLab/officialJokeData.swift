//
//  officialJokeData.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/2/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import Foundation

struct OfficialJokeData: Decodable {
  let results: [Joke]
}

struct Joke: Decodable {
  let id: Int
  let type: String
  let setup: String
  let punchline: String
}

extension OfficialJokeData {
  static func getJokes(from data: Data) -> [Joke] {
    var jokes = [Joke]()
    
    do {
        let officialJokesData = try JSONDecoder().decode(OfficialJokeData.self, from: data)
        jokes = officialJokesData.results
    } catch {
        fatalError("decoding error: \(error)")
    }
    
    return jokes
  }
//            static func getUsers(from data: Data) -> [User] {
//                var users = [User]()
//
//                do {
//                    let randomUserData = try JSONDecoder().decode(RandomUserData.self, from: data)
//                    users = randomUserData.results
//                } catch {
//                    fatalError("decoding error: \(error)")
//                }
//
//                return users
//            }
//        }
  
}
