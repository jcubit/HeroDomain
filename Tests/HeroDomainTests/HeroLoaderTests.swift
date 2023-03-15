//
//  HeroLoaderTests.swift
//  
//
//  Created by Javier Cuesta on 15.03.23.
//

import XCTest
@testable import HeroDomain

final class HeroLoaderTests: XCTestCase {

    func test_fetchHeroes() async throws {
        // Setup
        let baseURL = fixturesDirectory().absoluteString
        let heroRepository = HeroRepositoryMock()

        let heroLoader = HeroLoader(heroRepository: heroRepository,
                                    filter: {_ in true},
                                    baseURL: baseURL)
        // MUT
        let heroes = try await heroLoader.fetchHeroes()

        let mockHeroes = [Hero.Mock.antimage, Hero.Mock.axe, Hero.Mock.bane]
        let hero1 = try XCTUnwrap(heroes.first { $0.name == "Anti-Mage" })
        let hero2 = try XCTUnwrap(heroes.first { $0.name == "Axe" })
        let hero3 = try XCTUnwrap(heroes.first { $0.name == "Bane" })

        for (hero, mockHero) in zip(mockHeroes, [hero1, hero2, hero3]) {
            XCTAssertEqual(hero.name, mockHero.name)
            XCTAssertEqual(hero.attackType, mockHero.attackType)
            XCTAssertEqual(hero.primaryAttribute, mockHero.primaryAttribute)
            XCTAssertEqual(hero.id, mockHero.id)
            XCTAssertEqual(hero.roles, mockHero.roles)
            XCTAssertEqual(hero.stats, mockHero.stats)
        }
    }

    func test_filter_hero_by_attribute() async throws {
        // Setup
        let baseURL = fixturesDirectory().absoluteString
        let heroRepository = HeroRepositoryMock()

        let heroLoader = HeroLoader(heroRepository: heroRepository,
                                    filter: { hero in hero.primaryAttribute == .strength},
                                    baseURL: baseURL)
        // MUT
        let heroes = try await heroLoader.fetchHeroes()

        let mockHero = Hero.Mock.axe
        let hero = try XCTUnwrap(heroes.first)

        XCTAssertEqual(hero.name, mockHero.name)
        XCTAssertEqual(hero.attackType, mockHero.attackType)
        XCTAssertEqual(hero.primaryAttribute, mockHero.primaryAttribute)
        XCTAssertEqual(hero.id, mockHero.id)
        XCTAssertEqual(hero.roles, mockHero.roles)
        XCTAssertEqual(hero.stats, mockHero.stats)
    }

    func test_filter_hero_by_attack_type() async throws {
        // Setup
        let baseURL = fixturesDirectory().absoluteString
        let heroRepository = HeroRepositoryMock()

        let heroLoader = HeroLoader(heroRepository: heroRepository,
                                    filter: { hero in hero.attackType == .melee},
                                    baseURL: baseURL)
        // MUT
        let heroes = try await heroLoader.fetchHeroes()

        let mockHeroes = [Hero.Mock.antimage, Hero.Mock.axe]
        let hero1 = try XCTUnwrap(heroes.first { $0.name == "Anti-Mage" })
        let hero2 = try XCTUnwrap(heroes.first { $0.name == "Axe" })

        for (hero, mockHero) in zip(mockHeroes, [hero1, hero2]) {
            XCTAssertEqual(hero.name, mockHero.name)
            XCTAssertEqual(hero.attackType, mockHero.attackType)
            XCTAssertEqual(hero.primaryAttribute, mockHero.primaryAttribute)
            XCTAssertEqual(hero.id, mockHero.id)
            XCTAssertEqual(hero.roles, mockHero.roles)
            XCTAssertEqual(hero.stats, mockHero.stats)
        }
    }

    func test_filter_hero_by_role() async throws {
        // Setup
        let baseURL = fixturesDirectory().absoluteString
        let heroRepository = HeroRepositoryMock()

        let heroLoader = HeroLoader(heroRepository: heroRepository,
                                    filter: { hero in hero.roles.contains(.escape) },
                                    baseURL: baseURL)
        // MUT
        let heroes = try await heroLoader.fetchHeroes()

        let mockHero = Hero.Mock.antimage
        let hero = try XCTUnwrap(heroes.first)

        XCTAssertEqual(hero.name, mockHero.name)
        XCTAssertEqual(hero.attackType, mockHero.attackType)
        XCTAssertEqual(hero.primaryAttribute, mockHero.primaryAttribute)
        XCTAssertEqual(hero.id, mockHero.id)
        XCTAssertEqual(hero.roles, mockHero.roles)
        XCTAssertEqual(hero.stats, mockHero.stats)
    }
}
