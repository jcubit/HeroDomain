//
//  RawHeroTests.swift
//  
//
//  Created by Javier Cuesta on 14.03.23.
//

import XCTest
@testable import HeroDomain

final class RawHeroTests: XCTestCase {
    func test_decode_rawHero() throws {
        // Setup
        let rawHeroJSON = try XCTUnwrap(fixtureData(for: "heroes.json"))

        // MUT
        let rawHeros = try XCTUnwrap(try JSONDecoder().decode([RawHero].self, from: rawHeroJSON))

        XCTAssertEqual(rawHeros, [RawHero.Mock.antimage,
                                  RawHero.Mock.axe,
                                  RawHero.Mock.bane])
    }
}
