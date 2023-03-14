//
//  HeroTests.swift
//  
//
//  Created by Javier Cuesta on 14.03.23.
//

import XCTest
@testable import HeroDomain

final class HeroTests: XCTestCase {
    func test_init_from_rawHero_no_images() throws {
        // Setup
        let rawHero = RawHero.Mock.antimage

        let profileImageData = try XCTUnwrap(try fixtureData(for: rawHero.imageURL!))
        let profileImage = try XCTUnwrap(HeroImage(data: profileImageData))
        let iconData = try XCTUnwrap(try fixtureData(for: rawHero.iconURL!))
        let icon = try XCTUnwrap(HeroImage(data: iconData))

        // MUT
        let hero = try XCTUnwrap(Hero(rawHero, icon: icon, profileImage: profileImage))
        XCTAssertEqual(hero.name, Hero.Mock.antimage.name)
        XCTAssertEqual(hero.attackType, Hero.Mock.antimage.attackType)
        XCTAssertEqual(hero.primaryAttribute, Hero.Mock.antimage.primaryAttribute)
        XCTAssertEqual(hero.id, Hero.Mock.antimage.id)
        XCTAssertEqual(hero.roles, Hero.Mock.antimage.roles)
        XCTAssertEqual(hero.stats, Hero.Mock.antimage.stats)        
    }
}
