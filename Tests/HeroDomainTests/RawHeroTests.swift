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
        let rawHeroJSON = """
        [
          {
            "id": 1,
            "name": "npc_dota_hero_rawHero1",
            "localized_name": "RawHero1",
            "primary_attr": "int",
            "attack_type": "Ranged",
            "roles": [
                "Support",
                "Durable",
                "Initiator",
                "Carry"
            ],
            "img": "rawHero1.png",
            "icon": "iconRawHero1.png",
            "base_health": 200,
            "base_health_regen": 0.25,
            "base_mana": 400,
            "base_mana_regen": 0.3,
            "base_armor": 2,
            "base_mr": 90,
            "base_attack_min": 90,
            "base_attack_max": 100,
            "base_str": 5,
            "base_agi": 6,
            "base_int": 8,
            "str_gain": 1.9,
            "agi_gain": 1.9,
            "int_gain": 2.9,
            "attack_range": 625,
            "projectile_speed": 1250,
            "attack_rate": 1.7,
            "move_speed": 300,
            "turn_rate": null
          }
        ]
        """

        // MUT
        let rawHero = try XCTUnwrap(try JSONDecoder().decode([RawHero].self, from: Data(rawHeroJSON.utf8)))

        XCTAssertEqual(rawHero.first, RawHero.Mock.antimage)
    }
}
