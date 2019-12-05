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
  static func getTrivia() -> [Trivia] {
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
  
  static func getSections() -> [[Trivia]] {
    let trivia = TriviaData.getTrivia()
    
    let sortedTrivia = trivia.sorted { $0.difficulty < $1.difficulty }
    
    let difficulties: Set<String> = Set(trivia.map { $0.difficulty })
    
    var sectionArray = Array(repeating: [Trivia](), count: difficulties.count )
    
    var currentIndex = 0
    var currentDifficulty = sortedTrivia.first?.difficulty ?? ""
    for trivia in sortedTrivia {
      if trivia.difficulty == currentDifficulty {
        sectionArray[currentIndex].append(trivia)
      } else {
        currentIndex += 1
        currentDifficulty = trivia.difficulty
        sectionArray[currentIndex].append(trivia)
      }
    }
    return sectionArray
  }
}


