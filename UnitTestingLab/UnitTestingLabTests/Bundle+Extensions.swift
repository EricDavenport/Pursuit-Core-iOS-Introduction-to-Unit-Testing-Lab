//
//  Bundle+Extensions.swift
//  UnitTestingLab
//
//  Created by Eric Davenport on 12/3/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import Foundation

extension Bundle {        
    class func readRawJSONData(filename: String, ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("resource with filename \(filename) not found")
        }
        var data: Data!
        do {
            data = try Data.init(contentsOf: fileURL)
            
        } catch {
            fatalError("contents not found eror \(error)")
        }
   return data
}
}
