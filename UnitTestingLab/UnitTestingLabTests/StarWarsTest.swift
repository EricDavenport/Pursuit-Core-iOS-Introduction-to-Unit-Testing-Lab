//
//  StarWarsTest.swift
//  UnitTestingLabTests
//
//  Created by Eric Davenport on 12/3/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

class StarWarsTest: XCTestCase {

  let filename = "starWarsFilms"
  let ext = "json"
   
  func testNotNil() {
    let data = getData()
    
    XCTAssertNotNil(data)
  }
  func testEpisodeID() {
    // check fildID is less than 8
    let film = getFilms().first
    let filmID = film!.episode_id
    
    XCTAssertLessThan(filmID, 8, "\(filmID) should be less than 8")
  }
  
  func testFirstEpisodeDirector() {
    let film = getFilms().first
    let filmDirector = film?.director ?? ""
    let expectedDirector = "George Lucas"
    
    XCTAssertEqual(filmDirector, expectedDirector, "\(filmDirector) should match \(expectedDirector)")
  }

}


extension StarWarsTest {
  func getData() -> Data {
    let data = Bundle.readRawJSONData(filename: filename, ext: ext)
    return data
    
  }
  
  func getFilms() -> [Films] {
    //let data = getData()
    let films = StarWarsFilms.getData()
    return films
  }
}
