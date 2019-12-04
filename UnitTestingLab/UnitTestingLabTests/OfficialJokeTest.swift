//
//  UnitTestingLabTests.swift
//  UnitTestingLabTests
//
//  Created by Eric Davenport on 12/2/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

class OfficialJokeTest: XCTestCase {
  
  let filename = "officialJoke"
  let ext = "json"
  
  // test if files is poarsing correctly
  func testJokesNotNil() {
    let data = getData()
    
    XCTAssertNotNil(data)
  }
  
  // test first joke type
  func testJokeType() {
    let firstJoke = getJokes().first
    let expectedType = "programming"

    let firstJokeType = firstJoke?.type ?? ""

    XCTAssertEqual(firstJokeType, expectedType, "joke should be the same as \(expectedType)")
  }
  
  // test first joke ID
  func testFirstJokeID() {
    let firstJoke = getJokes().first
    let firstJokeID = firstJoke!.id
    
    let expectedID = 28
    
    XCTAssertEqual(firstJokeID, expectedID, "\(String(describing: firstJokeID)) should equal \(expectedID)")
  }
  
  // test first joke setup
  func testJokeSetup() {
    let firstJoke = getJokes().first
    let firstJokeSetup = firstJoke!.setup
    
    let expectedSetup = "To understand what recursion is..."
    
    XCTAssertEqual(firstJokeSetup, expectedSetup, "\(firstJokeSetup) should match \(expectedSetup)")
  }
  
  // test first joke punchline
  func testFirstJokePunchline() {
    let firstJoke = getJokes().first
    let expectedPunchline = "You must first understand what recursion is"
    let firstPunchline = firstJoke?.punchline ?? ""
    
    XCTAssertEqual(expectedPunchline, firstPunchline, "\(firstPunchline) should match \(expectedPunchline)")
    
  }
}


extension OfficialJokeTest {
  func getData() -> Data {
    let data = Bundle.readRawJSONData(filename: filename, ext: ext)
    return data
  }
  
  func getJokes() -> [Joke] {
    let data = getData()
    let jokes = Joke.getJokes()
    return jokes
  }
}
