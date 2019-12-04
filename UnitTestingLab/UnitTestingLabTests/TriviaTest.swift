//
//  TriviaTest.swift
//  UnitTestingLabTests
//
//  Created by Eric Davenport on 12/4/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

class TriviaTest: XCTestCase {

  let filename = "triviaAPI"
  let ext = "json"
  
  func testTriviaDataNotNil() {
    let data = getData()
    
    XCTAssertNotNil(data)
  }
  func testTriviaNotNil() {
    let trivia = getTriviaTest()
    
    XCTAssertNotNil(trivia)

  }
  
}

extension TriviaTest {
  func getData() -> Data {
    let data = Bundle.readRawJSONData(filename: filename, ext: ext)
    return data
  }
  
  func getTriviaTest() -> [Trivia] {
    let data = getData()
    let trivia = TriviaData.getTrivia(from: data)
    return trivia
  }
}
