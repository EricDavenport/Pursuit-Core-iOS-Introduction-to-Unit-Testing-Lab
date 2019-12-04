//
//  TriviaData.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/4/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import Foundation

struct TriviaData: Codable {
  let results: [Trivia]
  
}

struct Trivia: Codable {
  let category: String
  let type: String
  let difficulty: String
  let question: String
  let correct_answer: String
  let incorrect_answers: [String]
}

extension TriviaData {
  static func getTrivia(from data: Data) -> [Trivia] {
    var trivia = [Trivia]()
//
//    do {
//      let triviaData = try JSONDecoder().decode(TriviaData.self, from: data)
//      trivia = triviaData.results
//    } catch {
//      fatalError("Unable to decode error: \(error)")
//    }
//    return trivia
    guard let fileURL = Bundle.main.url(forResource: "triviaAPI", withExtension: "json") else {
      fatalError("failed to locate json file")
    }
    do {
      let data = try Data(contentsOf: fileURL)
      
      let triviaData = try JSONDecoder().decode(TriviaData.self, from: data)
      trivia = triviaData.results
    } catch {
      fatalError("failed to load contents \(error)")
    }
    return trivia
  
  }
}
