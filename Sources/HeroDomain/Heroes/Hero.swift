//
//  Hero.swift
//  HeroDomain
//
//  Created by Javier Cuesta on 13.03.23.
//

import Foundation

/// Domain Hero type
public struct Hero: Identifiable, Hashable {
    public let id: Int
    public let name: String
    public let primaryAttribute: Attribute
    public let attackType: Attack
    public let profileImage: HeroImage
    public let iconImage: HeroImage
    public let roles: [Role]
    public let stats: Stats

    /// Primary attribute type
    public enum Attribute: String {
        case agility = "agi"
        case intelligence = "int"
        case strength = "str"
    }

    /// Attack type
    public enum Attack: String {
        case melee
        case ranged
    }

    /// Different roles a Hero can have
    public enum Role: String {
        case carry
        case escape
        case nuker
        case initiator
        case durable
        case disabler
        case jungler
        case support
        case pusher
    }

    /// Base statistics of the Hero
    public struct Stats: Hashable, Equatable {
        public let health: Int
        public let healthRegeneration: Double
        public let mana: Int
        public let manaRegeneration: Double
        public let armor: Double
        public let minAttack: Int
        public let maxAttack: Int
        public let strength: Int
        public let agility: Int
        public let intelligence: Int
        public let strengthGain: Double
        public let agilityGain: Double
        public let intelligenceGain: Double
        public let attackRange: Int
        public let projectileSpeed: Int
        public let attackRate: Double
        public let moveSpeed: Int
    }
}

extension Hero.Attribute: CaseIterable {}
extension Hero.Attack: CaseIterable {}
extension Hero.Role: CaseIterable {}

extension Hero.Attribute: Identifiable {
    public var id: Self { self }
}

extension Hero.Attack: Identifiable {
    public var id: Self { self }
}

extension Hero.Role: Identifiable {
    public var id: Self { self }
}

extension Hero {
    public init?(_ rawHero: RawHero, icon: HeroImage, profileImage: HeroImage) {
        guard let id = rawHero.id,
              let name = rawHero.givenName,
              let primaryAttribute = rawHero.primaryAttribute,
              let attackType = rawHero.attackType,
              let stringRoles = rawHero.roles,
              let health = rawHero.health,
              let healthRegeneration = rawHero.healthRegeneration,
              let mana = rawHero.mana,
              let manaRegeneration = rawHero.manaRegeneration,
              let armor = rawHero.armor,
              let minAttack = rawHero.minAttack,
              let maxAttack = rawHero.maxAttack,
              let strength = rawHero.strength,
              let agility = rawHero.agility,
              let intelligence = rawHero.intelligence,
              let strengthGain = rawHero.strengthGain,
              let agilityGain = rawHero.agilityGain,
              let intelligenceGain = rawHero.intelligenceGain,
              let attackRange = rawHero.attackRange,
              let projectileSpeed = rawHero.projectileSpeed,
              let attackRate = rawHero.attackRate,
              let moveSpeed = rawHero.moveSpeed
        else { return nil }

        guard let attribute = Attribute(rawValue: primaryAttribute),
              let attack = Attack(rawValue: attackType.lowercased())
        else { return nil }

        let roles = stringRoles.compactMap { Role(rawValue: $0.lowercased()) }

        self.init(id: id,
                  name: name,
                  primaryAttribute: attribute,
                  attackType: attack,
                  profileImage: profileImage,
                  iconImage: icon,
                  roles: roles,
                  stats: Stats(health: health,
                               healthRegeneration: healthRegeneration,
                               mana: mana,
                               manaRegeneration: manaRegeneration,
                               armor: armor,
                               minAttack: minAttack,
                               maxAttack: maxAttack,
                               strength: strength,
                               agility: agility,
                               intelligence: intelligence,
                               strengthGain: strengthGain,
                               agilityGain: agilityGain,
                               intelligenceGain: intelligenceGain,
                               attackRange: attackRange,
                               projectileSpeed: projectileSpeed,
                               attackRate: attackRate,
                               moveSpeed: moveSpeed))
    }
}


