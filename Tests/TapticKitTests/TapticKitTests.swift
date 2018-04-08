//
//  TapticKitTests.swift
//  Andrey Sevrikov
//
//  Created by Andrey Sevrikov on 27/03/2018.
//  Copyright © 2018 Andrey Sevrikov. All rights reserved.
//

import Foundation
import XCTest
@testable import TapticKit

class TapticKitTests: XCTestCase {
    
    func testSupportLevel() {
        let supportLevel = TapticKit.supportLevel
        
        XCTAssertTrue(supportLevel == .none)
    }
}
